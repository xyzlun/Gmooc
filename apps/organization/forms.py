# _*_ coding: utf-8 _*_
__author__ = 'chengtianlun'
__date__ = '2018/4/25 10:25'
from django import forms
from operation.models import UserAsk


class UserAskForm(forms.ModelForm):

    class Meta:
        model = UserAsk
        fields = ['name','mobile','course_name']