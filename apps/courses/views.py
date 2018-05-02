# _*_ coding: utf-8 _*_

from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from models import Course

# Create your views here.
class CourseListView(View):
    def get(self,request):
        current_page = 'course_list'
        all_courses = Course.objects.all()
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
        })