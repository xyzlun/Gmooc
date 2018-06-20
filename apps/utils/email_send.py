# _*_ coding: utf-8 _*_
__author__ = 'chengtianlun'
__date__ = '2018/4/12 15:29'

from users.models import EmailVerifyRecord
from random import Random
from django.core.mail import send_mail
from Gmooc.settings import EMAIL_FROM

def send_register_email(email, send_type='register'):  # 发送激活邮件
    email_record = EmailVerifyRecord()
    if send_type == 'update_email':
        code = random_str(4)
    else:
        code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()  # 保存进数据库

    email_title = ''
    email_body = ''
    if send_type == 'register':
        email_title = u'慕学在线网注册激活链接'
        email_body = u'请点击下面的链接激活你的账号：http://127.0.0.1:8000/active/{0}'.format(code)

        send_status = send_mail(email_title,email_body,EMAIL_FROM,[email])
        if send_status:
            pass
    elif send_type == 'forget':
        email_title = u'慕学在线网密码重置链接'
        email_body = u'请点击下面的链接重置你的账号：http://127.0.0.1:8000/reset/{0}'.format(code)
        send_status = send_mail(email_title,email_body,EMAIL_FROM,[email])
        if send_status:
            pass
    elif send_type == 'update_email':
        email_title = u'慕学在线网邮箱修改验证链接'
        email_body = u'你的邮箱验证码为：{0}'.format(code)
        send_status = send_mail(email_title,email_body,EMAIL_FROM,[email])
        if send_status:
            pass

def random_str(randomlength=8):  # 用于生成随机字符串发送在激活链接中
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(randomlength):
        str += chars[random.randint(0, length)]
    return str