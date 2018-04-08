# _*_ coding: utf-8 _*_
__author__ = 'chengtianlun'
__date__ = '2018/4/8 15:25'

import xadmin
from .models import CityDict, CourseOrg, Teacher

class CityDictAdmin(object):
    list_display = [
        'name', 'desc', 'add_time'
    ]
    search_field = [
        'name', 'desc'
    ]
    list_filter = [
        'name', 'desc', 'add_time'
    ]


class CourseOrgAdmin(object):
    list_display = [
        'city', 'name', 'desc', 'click_num',
        'fav_num', 'image', 'address', 'add_time'
    ]
    search_field = [
        'city', 'name', 'desc', 'address'
    ]
    list_filter = [
        'city', 'name', 'desc', 'click_num',
        'fav_num', 'image', 'address', 'add_time'
    ]


class TeacherAdmin(object):
    list_display = [
        'org', 'name', 'work_years', 'work_company',
        'work_position', 'points', 'click_num', 'fav_num', 'add_time'
    ]
    search_field = [
        'org', 'name', 'work_years', 'work_company',
        'work_position', 'points'
    ]
    list_filter = [
        'org', 'name', 'work_years', 'work_company',
        'work_position', 'points', 'click_num', 'fav_num', 'add_time'
    ]

xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)