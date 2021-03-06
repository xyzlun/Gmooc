# _*_ coding:utf-8 _*_
__author__ = 'chengtianlun'
__date__ = '2018/4/8 11:04'

import  xadmin
from xadmin import views
from .models import EmailVerifyRecord,UserProfile,Banner


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True

class GlobalSetting(object):
    site_title = u'后台管理系统'
    site_footer = u'程天伦'
    menu_style = 'accordion'

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
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSetting)
