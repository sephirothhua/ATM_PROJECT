from django.db import models
import django.utils.timezone
from django.contrib.auth.models import AbstractUser
from django.utils.crypto import get_random_string

from rest_framework import serializers
from django.contrib.auth import authenticate
from rest_framework import exceptions
import re
import logging

logger = logging.getLogger("django")
status_info = {0: '正常', 1: '异常'}


class Camera(models.Model):
    name = models.CharField(max_length=128, verbose_name="名称")
    position = models.CharField(max_length=128, verbose_name="位置")
    latitude = models.CharField(max_length=128, verbose_name='纬度')
    longitude = models.CharField(max_length=128, verbose_name='经度')
    rstp = models.CharField(max_length=128, verbose_name='rstp')
    status = models.SmallIntegerField(max_length=10, verbose_name="状态", default=0)
    is_alert = models.SmallIntegerField(max_length=10, verbose_name="是否报警", default=0)
    created_date = models.DateTimeField(default=django.utils.timezone.now, verbose_name='创建日期')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "设备"
        verbose_name_plural = verbose_name


class CameraSerializer(serializers.ModelSerializer):

    # 验证纬度
    def validate_latitude(self, latitude):
        if float(latitude) < -90 or float(latitude) > 90:
            raise serializers.ValidationError('纬度超出范围')
        return latitude

    # 验证经度
    def validate_longitude(self, longitude):
        if float(longitude) < -180 or float(longitude) > 180:
            raise serializers.ValidationError('经度超出范围')
        return longitude

    # 验证rstp
    def validate_rstp(self, rstp):
        if not re.match(r'^rtsp:/{2}\w.+$', rstp):
            raise serializers.ValidationError('rstp必须为url')
        return rstp

    class Meta:
        model = Camera
        fields = '__all__'


class AlertLog(models.Model):
    camera_id = models.CharField(max_length=128, verbose_name='摄像机id')
    position = models.CharField(max_length=128, verbose_name='位置')
    longitude = models.CharField(max_length=128, verbose_name='经度')
    latitude = models.CharField(max_length=128, verbose_name='纬度')
    video = models.CharField(max_length=128, verbose_name='视频')
    mask_status = models.SmallIntegerField(max_length=10, verbose_name='戴面具', default=0)
    glass_status = models.SmallIntegerField(max_length=10, verbose_name='戴墨镜', default=0)
    follow_status = models.SmallIntegerField(max_length=10, verbose_name='跟随', default=0)
    leave_status = models.SmallIntegerField(max_length=10, verbose_name='遗留物', default=0)
    created_date = models.DateTimeField(default=django.utils.timezone.now, verbose_name='日期')

    def __str__(self):
        return self.camera_id

    class Meta:
        verbose_name = "异常日志"
        verbose_name_plural = verbose_name


class AlertLogSerializer(serializers.ModelSerializer):

    # 验证纬度
    def validate_latitude(self, latitude):
        if float(latitude) < -90 or float(latitude) > 90:
            raise serializers.ValidationError('纬度超出范围')
        return latitude

    # 验证经度
    def validate_longitude(self, longitude):
        if float(longitude) < -180 or float(longitude) > 180:
            raise serializers.ValidationError('经度超出范围')
        return longitude

    class Meta:
        model = AlertLog
        fields = '__all__'


class Log(models.Model):
    camera = models.ForeignKey(Camera, on_delete=models.CASCADE, verbose_name="摄像机id")
    image_path = models.CharField(max_length=128, verbose_name="图片路径")
    status = models.SmallIntegerField(max_length=10, verbose_name="状态")
    created_date = models.DateTimeField(default=django.utils.timezone.now, verbose_name='创建日期')

    class Meta:
        verbose_name = "日志"
        verbose_name_plural = verbose_name


class LogSerializer(serializers.ModelSerializer):
    camera_name = serializers.SerializerMethodField()
    status_name = serializers.SerializerMethodField()

    # 关联查询
    def get_camera_name(self, obj):
        return obj.camera.name

    def get_status_name(self, obj):
        return status_info[obj.status]

    class Meta:
        model = Log
        fields = '__all__'


class Error(models.Model):
    message = models.CharField(max_length=128, verbose_name="错误描述")
    type = models.SmallIntegerField(max_length=10, verbose_name="类型")
    created_date = models.DateTimeField(default=django.utils.timezone.now, verbose_name='创建日期')

    class Meta:
        verbose_name = "错误日志"
        verbose_name_plural = verbose_name


class User(AbstractUser):
  username = models.CharField(max_length=10, verbose_name="姓名", unique=True)

  def __str__(self):
    return self.username

  class Meta:
    verbose_name = "用户"
    verbose_name_plural = verbose_name


class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(min_length=6, max_length=20, label="新密码", write_only=True)

    # 验证邮箱
    def validate_email(self, email):
        if not re.findall(r'^\w+@(\w+.)+(com|cn|net)$', email):
            raise serializers.ValidationError('邮箱格式错误')
        return email

    def create(self, validated_data):
        logger.info(validated_data)
        user = User.objects.create_user(**validated_data)
        # user = super().create(**validated_data)
        user.set_password(validated_data['password'])
        user.save()

        return user

    # def update(self, instance, validated_data):
    #     super().update(instance, validated_data)
    #     if "password" in validated_data:
    #         instance.set_password(validated_data)
    #     return instance

    class Meta:
        model = User
        fields = "__all__"
        # exclude = ("password", )

class ChangePWSerializer(serializers.Serializer):
    current_password = serializers.CharField(min_length=6, max_length=20, label="当前密码")
    new_password = serializers.CharField(min_length=6, max_length=20, label="新密码")

    def validate_current_password(self, value):
        username = self.context["request"].user.username
        user = authenticate(username=username, password=value)
        if user is None:
            raise exceptions.ValidationError("The current password incorrect")
        return value






