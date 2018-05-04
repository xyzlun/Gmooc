# _*_ coding: utf-8 _*_

from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from operation.models import UserFavorite,CourseComments,UserCourse
from django.http import HttpResponse
import json


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
        current_page = 'course_list'
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
            'current_page' : current_page,
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
        current_page = 'course_list'
        course = Course.objects.get(id=int(course_id))
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user.id for user_course in user_courses]
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        #取出所有课程id
        course_ids = [user_course.course.id for user_course in user_courses]
        #获取学过该课程的其他用户学习的课程（取点击量前五）
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_num')[:5]
        all_resources = CourseResource.objects.filter(course=course)
        return render(request, 'course-video.html',{
            'current_page': current_page,
            'course' : course,
            'course_resources' : all_resources,
            'relate_courses': relate_courses,
        })


class CommentsView(View):
    '''
    课程评论
    '''
    def get(self, request, course_id):
        current_page = 'course_list'
        course = Course.objects.get(id=int(course_id))
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user.id for user_course in user_courses]
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        #取出所有课程id
        course_ids = [user_course.course.id for user_course in user_courses]
        #获取学过该课程的其他用户学习的课程（取点击量前五）
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_num')[:5]
        all_resources = CourseResource.objects.filter(course=course)
        all_comments = CourseComments.objects.filter(course=course)
        return render(request, 'course-comment.html',{
            'current_page' : current_page,
            'course' : course,
            'course_resources' : all_resources,
            'all_comments' : all_comments,
            'relate_courses' : relate_courses
        })


class AddCommentsView(View):
    '''
    用户添加课程评论
    '''
    def post(self,request):
        if not request.user.is_authenticated():
            # 判断用户登录状态
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '用户未登录'}), content_type="application/json")
        course_id = request.POST.get('course_id','')
        comments = request.POST.get('comments','')
        if course_id > 0 and comments:
            course_comment = CourseComments()
            course = Course.objects.get(id=int(course_id))
            course_comment.course = course
            course_comment.comments = comments
            course_comment.user = request.user
            course_comment.save()
            return HttpResponse(json.dumps({'status': 'success', 'msg': '评论成功'}), content_type="application/json")
        else:
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '评论失败'}), content_type="application/json")
