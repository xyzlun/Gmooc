# _*_ coding: utf-8 _*_
__author__ = 'chengtianlun'
__date__ = '2018/4/12 9:36'
from django import forms
from captcha.fields import CaptchaField

class LoginForm(forms.Form):  # 将登录页面的表单对象化，并做字段配置
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)


class RegisterForm(forms.Form):  # 将注册时提交的表单对象化，并做字段配置
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=5)
    captcha = CaptchaField(error_messages={'invalid':u'验证码错误'})