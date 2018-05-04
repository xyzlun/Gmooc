# _*_ coding: utf-8 _*_
__author__ = 'chengtianlun'
__date__ = '2018/5/2 11:17'

from django.conf.urls import url, include
from views import CourseListView,CourseDetailView,CourseInfoView,CommentsView,AddCommentsView

urlpatterns =  [
    # 课程机构首页
    url(r'^list/$', CourseListView.as_view(), name='course_list'),
    # 课程详情页
    url(r'^detail/(?P<course_id>\d+)/$', CourseDetailView.as_view(), name='course_detail'),
    # 公开课视频信息
    url(r'^info/(?P<course_id>\d+)/$', CourseInfoView.as_view(), name='course_info'),
    # 课程评论
    url(r'^comment/(?P<course_id>\d+)/$', CommentsView.as_view(), name='course_comment'),
    # 添加课程评论
    url(r'^add_comment/$', AddCommentsView.as_view(), name='add_comment'),

]