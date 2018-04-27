# _*_ coding:utf-8 _*_
from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse
import json

from .models import CourseOrg,CityDict
from .forms import UserAskForm
from courses.models import Course


from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.


class OrgView(View):
    '''
    课程机构列表功能
    '''
    def get(self,request):
        #课程机构
        all_orgs = CourseOrg.objects.all()
        hot_orgs = all_orgs.order_by("-click_num")[:3]  # 对机构的点击量进行排序后取出前三个
        #城市
        all_citys = CityDict.objects.all()
        # 取出筛选城市
        city_id = request.GET.get('city', '')
        if city_id:
            all_orgs = CourseOrg.objects.filter(city_id=int(city_id))
        # 类别筛选
        category = request.GET.get('ct', '')
        if category:
            all_orgs = CourseOrg.objects.filter(category=category)
        # 排序
        sort = request.GET.get('sort', '')
        if sort == 'students':
            all_orgs = all_orgs.order_by('-students')
        elif sort == 'courses':
            all_orgs = all_orgs.order_by('-course_nums')
        org_nums = all_orgs.count()

        # 对课程机构进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_orgs,3, request=request)
        orgs = p.page(page)
        return render(request, 'org_list.html', {
            'all_orgs' : orgs,
            'all_citys': all_citys,
            'org_nums' : org_nums,
            'city_id' : city_id,
            'category' : category,
            'hot_orgs' : hot_orgs,
            'sort' : sort,
        })


class AddUserAskView(View):
    '''
    用户添加咨询
    '''
    def post(self,request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            #return HttpResponse(json.dumps({'status':'success'}), content_type='application/json')
            return HttpResponse(json.dumps({'status':'success'}),content_type='application/json')
        else:
            #return HttpResponse("{'status': 'fail','msg':'添加出错'}",content_type="application/json")
            return HttpResponse(json.dumps({'status': 'fail','msg':'添加出错'}),content_type="application/json")


class OrgHomeView(View):
    '''
    机构首页
    '''
    def get(self, request, org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()[:3]  # 通过外键定义的关系反向查找
        all_teachers = course_org.teacher_set.all()[:1]
        return render(request, 'org-detail-homepage.html',{
            'all_courses' : all_courses,
            'all_teachers' : all_teachers,
            'course_org' : course_org,

        })
