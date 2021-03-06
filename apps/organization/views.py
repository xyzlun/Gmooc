# _*_ coding:utf-8 _*_
import json

from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse
from django.db.models import Q

from .models import CourseOrg,CityDict
from .forms import UserAskForm
from operation.models import UserFavorite
from courses.models import Course
from models import Teacher


from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.


class OrgView(View):
    '''
    课程机构列表功能
    '''
    def get(self,request):
        #课程机构
        current_page = 'org_list'
        all_orgs = CourseOrg.objects.all()
        hot_orgs = all_orgs.order_by("-click_num")[:3]  # 对机构的点击量进行排序后取出前三个
        #城市
        all_citys = CityDict.objects.all()

        #机构搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_orgs = all_orgs.filter(
                Q(name__icontains=search_keywords)|
                Q(desc__icontains=search_keywords)
            )

        # 取出筛选城市
        city_id = request.GET.get('city', '')
        # if city_id:
        #     all_orgs = CourseOrg.objects.filter(city_id=int(city_id))
        # 类别筛选
        category = request.GET.get('ct', '')
        if category and city_id:
            all_orgs = CourseOrg.objects.filter(city_id=int(city_id),category=category)
        # 排序
        sort = request.GET.get('sort', '')
        if sort == 'students':
            all_orgs = all_orgs.order_by('-students')
        elif sort == 'courses':
            all_orgs = all_orgs.order_by('-course_nums')
        org_nums = all_orgs.count()

        all_courses = {}
        for item in all_orgs:
            all_courses[item] = item.course_set.all()[:3]  # 通过外键定义的关系反向查找
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
            'all_courses' : all_courses,
            'current_page' : current_page
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
        current_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))
        course_org.click_num += 1
        course_org.save()
        has_fav = False
        if request.user.is_authenticated():
             if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                 has_fav = True
        #用户未登录跳转登录页面
        else:
            return render(request, 'login.html')
        all_courses = course_org.course_set.all()[:3]  # 通过外键定义的关系反向查找
        all_teachers = course_org.teacher_set.all()[:1]
        return render(request, 'org-detail-homepage.html',{
            'all_courses' : all_courses,
            'all_teachers' : all_teachers,
            'course_org' : course_org,
            'current_page' : current_page,
            'has_fav' : has_fav,

        })

class OrgCourseView(View):
    '''
    机构课程列表页
    '''
    def get(self, request, org_id):
        current_page = 'course'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
             if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=1):
                 has_fav = True
        #用户未登录跳转登录页面
        else:
            return render(request, 'login.html')
        all_courses = course_org.course_set.all()  # 通过外键定义的关系反向查找
        return render(request, 'org-detail-course.html',{
            'all_courses' : all_courses,
            'course_org' : course_org,
            'current_page' : current_page,
            'has_fav' : has_fav,

        })

class OrgDescView(View):
    '''
    机构介绍
    '''
    def get(self, request, org_id):
        current_page = 'desc'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
             if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                 has_fav = True
        #用户未登录跳转登录页面
        else:
            return render(request, 'login.html')
        return render(request, 'org-detail-desc.html',{
            'course_org' : course_org,
            'current_page' : current_page,
            'has_fav' : has_fav,
        })

class OrgTeacherView(View):
    '''
    机构讲师
    '''
    def get(self, request, org_id):
        current_page = 'teacher'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
             if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=3):
                 has_fav = True
        #用户未登录跳转登录页面
        else:
            return render(request, 'login.html')
        all_teachers = course_org.teacher_set.all()  # 通过外键定义的关系反向查找
        return render(request, 'org-detail-teachers.html',{
            'course_org' : course_org,
            'current_page' : current_page,
            'all_teachers' : all_teachers,
            'has_fav' : has_fav
        })

class AddFavView(View):
    '''
    用户添加、删除收藏
    '''
    def post(self,request):
        fav_id = request.POST.get('fav_id',0)
        fav_type = request.POST.get('fav_type','')

        if not request.user.is_authenticated():
            # 判断用户登录状态
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '用户未登录'}), content_type="application/json")
        exist_records = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_records:
            #如果记录已经存在，则表示用户取消收藏
            exist_records.delete()  # 删除记录
            if int(fav_type) == 1:
                course = Course.objects.get(id=int(fav_id))
                course.fav_num -= 1
                if course.fav_num < 0 : course.fav_num = 0
                course.save()
            elif int(fav_type) == 2:
                course_org = CourseOrg.objects.get(id=int(fav_id))
                course_org.fav_num -= 1
                if course_org.fav_num < 0 : course_org.fav_num = 0
                course_org.save()
            elif int(fav_type) == 3:
                teacher = Teacher.objects.get(id=int(fav_id))
                teacher.fav_num -= 1
                if teacher.fav_num < 0 : teacher.fav_num = 0
                teacher.save()
            return HttpResponse(json.dumps({'status': 'delete', 'msg': '收藏'}), content_type="application/json")
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()
                if int(fav_type) == 1:
                    course = Course.objects.get(id=int(fav_id))
                    course.fav_num += 1
                    course.save()
                elif int(fav_type) == 2:
                    course_org = CourseOrg.objects.get(id=int(fav_id))
                    course_org.fav_num += 1
                    course_org.save()
                elif int(fav_type) == 3:
                    teacher = Teacher.objects.get(id=int(fav_id))
                    teacher.fav_num += 1
                    teacher.save()
                return HttpResponse(json.dumps({'status': 'success', 'msg': '已收藏'}), content_type="application/json")
            else:
                return HttpResponse(json.dumps({'status': 'fail', 'msg': '收藏失败'}), content_type="application/json")

class TeacherListView(View):
    '''
    讲师列表页功能
    '''
    def get(self, request):
        all_teachers = Teacher.objects.all()

        #讲师搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_teachers = all_teachers.filter(
                Q(name__icontains=search_keywords)|
                Q(work_company__icontains=search_keywords)|
                Q(work_position__icontains=search_keywords)
            )

        # 排序
        sort = request.GET.get('sort', '')
        if sort == 'hot':
            all_teachers = all_teachers.order_by('-click_num')
        teacher_num = all_teachers.count()

        #讲师排行
        sorted_teacher = Teacher.objects.all().order_by('-click_num')[:3]
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_teachers,3, request=request)
        teachers = p.page(page)

        return render(request, 'teachers-list.html', {
            'teachers' : teachers,
            'teacher_num' : teacher_num,
            'sorted_teacher' : sorted_teacher,
            'sort' : sort
        })

class TeacherDetailView(View):
    '''
    讲师详情页功能
    '''
    def get(self, request, teacher_id):
        current_page = 'teacher_list'
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher.click_num += 1
        teacher.save()
        # courses = teacher.course_set.all()
        courses = Course.objects.filter(teacher=teacher)

        has_teacher_faved = False
        if UserFavorite.objects.filter(user=request.user, fav_type=3, fav_id=teacher.id):
            has_teacher_faved = True
        has_org_faved = False
        if UserFavorite.objects.filter(user=request.user, fav_type=2, fav_id=teacher.org.id):
            has_org_faved = True

        classic_courses = courses[:3]
        #讲师排行
        sorted_teacher = Teacher.objects.all().order_by('-click_num')[:3]
        return render(request, 'teacher-detail.html', {
            'current_page' : current_page,
            'teacher' : teacher,
            'sorted_teacher' : sorted_teacher,
            'courses' : courses,
            'classic_courses' : classic_courses,
            'has_teacher_faved' : has_teacher_faved,
            'has_org_faved' : has_org_faved,
        })