# _*_ coding:utf-8 _*_
from django.shortcuts import render
from django.contrib.auth import authenticate,login
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password

from .models import UserProfile,EmailVerifyRecord
from .forms import LoginForm,RegisterForm,ForgetForm
from utils.email_send import send_register_email
class CustomBackend(ModelBackend):  # 重载用户名密码验证方法
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LoginView(View):  # 登录页面的后台逻辑
    def get(self,request):
        return render(request, 'login.html', {})
    def post(self,request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get('username','')
            pass_word = request.POST.get('password','')
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if user.is_active:
                    login(request,user)
                    return render(request,'index.html', {'login_form': login_form})
                else:
                    return render(request, 'login.html', {'msg': u'用户名未激活!', 'login_form': login_form})
            else:
                return render(request, 'login.html', {'msg': u'用户名或密码错误!', 'login_form': login_form})
        else:
            return render(request, 'login.html', {'login_form':login_form})


class RegisterView(View):  # 注册页面后台逻辑
    def get(self, request):  # 如果为GET方法时的逻辑
        register_form = RegisterForm()  # 实例化RegisterForm，并传递回register.html
        return render(request, 'register.html', {'register_form':register_form})
    def post(self,request):  # 如果为POST方法时的逻辑
        register_form = RegisterForm(request.POST)
        if  register_form.is_valid():  # RegisterForm实例验证结果
            user_name = request.POST.get('email','')
            if UserProfile.objects.filter(email=user_name):  # 验证用户是否存在
                return render(request, 'register.html', {'register_form': register_form, 'msg': u'用户已存在!'})
            pass_word = request.POST.get('password','')
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.is_active = False
            user_profile.password = make_password(pass_word)
            user_profile.save()
            send_register_email(user_name, 'register')
            return render(request, 'login.html')
        else:
            return render(request, 'register.html', {'register_form': register_form ,'msg': u'注册失败!'})


class ActiveUserView(View):  # 激活用户后台逻辑
    def  get(self, request, active_code):
        all_record = EmailVerifyRecord.objects.filter(code=active_code)  # 查询激活码和获取到的active_code相同的记录
        if all_record:  # 如果不为空
            for record in all_record:  # 遍历记录
                email = record.email
                user = UserProfile.objects.get(email=email)  # 匹配记录中邮箱地址相同的userprofile，修改is_active值
                user.is_active = True
                user.save()
        else:
            return render(request, 'active_fail.html')
        return render(request, 'login.html')


class ForgetPwdView(View):
    def get(self, request):
        forget_form = ForgetForm()
        return render(request, 'forgetpwd.html', {'forget_form':forget_form})
    def post(self,request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get('email', '')
            send_register_email(email, 'forget')
            return render(request, 'send_success.html')
        else:
            return render(request, 'forgetpwd.html', {'forget_form': forget_form})
