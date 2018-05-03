# _*_ coding: utf-8 _*_
__author__ = 'chengtianlun'
__date__ = '2018/5/2 11:17'

from django.conf.urls import url, include
from views import CourseListView,CourseDetailView,CourseInfoView

urlpatterns =  [
    # 课程机构首页
    url(r'^list/$', CourseListView.as_view(), name='course_list'),
    # 课程详情页
    url(r'^detail/(?P<course_id>\d+)/$', CourseDetailView.as_view(), name='course_detail'),
    # 公开课视频信息
    url(r'^info/(?P<course_id>\d+)/$', CourseInfoView.as_view(), name='course_info'),

]