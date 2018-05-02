# _*_ coding: utf-8 _*_

from django.shortcuts import render
from django.views.generic.base import View
from models import Course

# Create your views here.
class CourseListView(View):
    def get(self,request):
        current_page = 'course_list'
        all_courses = Course.objects.all()
        return render(request, 'course-list.html',{
            'all_courses' : all_courses,
            'current_page' : current_page,
        })