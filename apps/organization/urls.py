# _*_ coding: utf-8 _*_
__author__ = 'chengtianlun'
__date__ = '2018/4/25 10:56'

from django.conf.urls import url, include
from .views import OrgView,AddUserAskView,OrgHomeView

urlpatterns =  [
    # 课程机构首页
    url(r'^list/$', OrgView.as_view(), name='org_list'),
    url(r'^add_ask/$',AddUserAskView.as_view(), name='add_ask'),
    url(r'^home/(?P<org_id>\d+)/$', OrgHomeView.as_view(), name='org_home')

]