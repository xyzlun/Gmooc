# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-05-10 23:00
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0009_teacher_age'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacher',
            name='education',
            field=models.CharField(default='', max_length=50, verbose_name='\u5b66\u5386'),
        ),
    ]
