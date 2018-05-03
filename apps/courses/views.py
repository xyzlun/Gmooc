# _*_ coding: utf-8 _*_

from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from operation.models import UserFavorite



from models import Course,CourseResource

# Create your views here.
class CourseListView(View):
    def get(self,request):
        current_page = 'course_list'
        all_courses = Course.objects.all().order_by('-add_time')  # 减号表示降序排列

        hot_courses =  Course.objects.all().order_by('-click_num')[:3]
        #课程排序
        sort = request.GET.get('sort', '')
        if sort == 'students':
            all_courses = all_courses.order_by('-students')
        elif sort == 'hot':
            all_courses = all_courses.order_by('-click_num')
        course_nums = all_courses.count()
        # 对课程进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_courses, 6, request=request)
        courses = p.page(page)
        return render(request, 'course-list.html',{
            'all_courses' : courses,
            'current_page' : current_page,
            'sort' : sort,
            'hot_courses' : hot_courses
        })


class CourseDetailView(View):
    '''
    课程详情页
    '''
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))
        course.click_num += 1  # 增加课程点击数
        course.save()

        has_fav_course = False
        has_fav_org = False

        if request.user.is_authenticated():
            # 判断用户登录状态
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1 ):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                has_fav_org = True
        tag = course.tag
        relate_courses = None
        if tag:
            relate_courses = Course.objects.filter(tag=tag)[:2]
        return render(request, 'course-detail.html',{
            'course' : course,
            'relate_courses' : relate_courses,
            'has_fav_course' : has_fav_course,
            'has_fav_org' : has_fav_org,
        })


class CourseInfoView(View):
    '''
    课程章节信息
    '''
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        all_resources = CourseResource.objects.filter(course=course)
        return render(request, 'course-video.html',{
            'course' : course,
            'course_resources' : all_resources,

        })