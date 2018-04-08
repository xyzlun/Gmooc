# _*_ coding: utf-8 _*_
__author__ = 'chengtianlun'
__date__ = '2018/4/8 14:42'

import xadmin
from .models import Course,Video,Lesson,CourseResource


class CourseAdmin(object):
    list_display = [
        'name', 'desc', 'detail', 'degree', 'learn_times', 'students',
        'fav_num', 'image', 'click_num', 'add_time'
    ]
    search_field = [
        'name', 'desc', 'detail', 'degree'
    ]
    list_filter = [
        'name', 'desc', 'detail', 'degree', 'students', 'add_time'
    ]


class LessonAdmin(object):
    list_display = [
        'course', 'name', 'add_time'
    ]
    search_field = [
        'course', 'name'
    ]
    list_filter = [
        'course__name', 'name', 'add_time'
    ]


class VideoAdmin(object):
    list_display = [
        'lesson', 'name', 'add_time'
    ]
    search_field = [
        'lesson', 'name'
    ]
    list_filter = [
        'lesson', 'name', 'add_time'
    ]


class CourseResourceAdmin(object):
    list_display = [
        'course', 'name', 'download', 'add_time'
    ]
    search_field = [
        'course', 'name'
    ]
    list_filter = [
        'course', 'name', 'download', 'add_time'
    ]
xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)