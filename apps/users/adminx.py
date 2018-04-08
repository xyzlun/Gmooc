# _*_ coding: utf-8 _*_
__author__ = 'chengtianlun'
__date__ = '2018/4/8 11:04'

import  xadmin
from .models import EmailVerifyRecord,UserProfile,Banner


class EmailVerifyRecordAdmin(object):
    list_display = ['code', 'email', 'send_type', 'send_time']
    search_fields = ['code', 'email', 'send_type']
    list_filter = ['code', 'email', 'send_type', 'send_time']


# class UserProfileAdmin(object):
#     pass
#
# xadmin.site.register(UserProfile, UserProfileAdmin)

class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index', 'add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index', 'add_time']


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)
