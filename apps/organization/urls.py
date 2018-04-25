# _*_ coding: utf-8 _*_
__author__ = 'chengtianlun'
__date__ = '2018/4/25 10:56'

from django.conf.urls import url, include
from .views import OrgView

urlpatterns =  [
    # 课程机构首页
    url(r'^list/$', OrgView.as_view(), name='org_list'),
    #url(r'^add_ask/$,)
]