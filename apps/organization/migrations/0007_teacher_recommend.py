# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-05-07 15:24
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0006_teacher_course_num'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacher',
            name='recommend',
            field=models.IntegerField(default=5, verbose_name='\u63a8\u8350\u6307\u6570'),
        ),
    ]
