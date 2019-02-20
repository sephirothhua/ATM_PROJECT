from django.views.generic import TemplateView
from django.views.decorators.cache import never_cache

from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import mixins
from rest_framework import status
from rest_framework import exceptions
from rest_framework.decorators import action
from rest_framework import permissions
import cv2
from django.http import HttpResponse,StreamingHttpResponse
import json,urllib
import urllib.parse

from .models import *
from .pagination import CPageNumberPagination,CPageNumberPagination2
import logging

from coal.detection.gh_rfcn_python import rfcn_show_pic_cv
import time

logger = logging.getLogger("django")

# Serve Vue Application
rfcn_show_pic_cv.process_start()
index_view = never_cache(TemplateView.as_view(template_name='index.html'))


class CameraViewSet(mixins.ListModelMixin,
                    mixins.CreateModelMixin,
                    mixins.RetrieveModelMixin,
                    mixins.DestroyModelMixin,
                    mixins.UpdateModelMixin,
                    viewsets.GenericViewSet):

    # 按照日期排序
    queryset = Camera.objects.all().order_by('-created_date')
    serializer_class = CameraSerializer
    pagination_class = CPageNumberPagination
    permission_classes = []

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        return Response(serializer.data)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        logger.debug("{request.user.username}删除表{table_name}")
        return Response(status=status.HTTP_204_NO_CONTENT)

    # 获取所有设备
    @action(methods=['get'], url_path='get_devices', detail=False)
    def get_devices(self, requset, *args, **kwargs):
        data = {
          "results": self.get_serializer(Camera.objects.all(), many=True).data
        }
        return Response(data)


class LogViewSet(mixins.ListModelMixin,
                 mixins.CreateModelMixin,
                 mixins.RetrieveModelMixin,
                 mixins.DestroyModelMixin,
                 mixins.UpdateModelMixin,
                 viewsets.GenericViewSet):

    # 按照日期排序
    queryset = Log.objects.all().order_by('-created_date')
    serializer_class = LogSerializer
    pagination_class = CPageNumberPagination2

    def list(self, request, *args, **kwargs):
        name = request.query_params.get('name')
        date = request.query_params.get('date')
        camera_id = request.query_params.get('id')

        queryset = Log.objects.all().order_by('-created_date')
        if name:
          queryset = queryset.filter(camera__name=name)
        if date:
          queryset = queryset.filter(created_date__startswith=date)
        if camera_id:
          queryset = queryset.filter(camera__id=camera_id)

        page = self.paginate_queryset(queryset)

        serializer = self.get_serializer(page, many=True)
        return self.get_paginated_response(serializer.data)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        logger.debug("{request.user.username}删除表{table_name}")
        return Response(status=status.HTTP_204_NO_CONTENT)


class UserViewSet(mixins.ListModelMixin,
                  mixins.CreateModelMixin,
                  mixins.RetrieveModelMixin,
                  mixins.DestroyModelMixin,
                  mixins.UpdateModelMixin,
                  viewsets.GenericViewSet):
    # 按照日期排序
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    pagination_class = CPageNumberPagination
    # permission_classes = (permissions.IsAuthenticated, )

    def get_serializer_class(self):
        if self.action == "change_password":
            return ChangePWSerializer

        return super().get_serializer_class()

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        return Response(serializer.data)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        logger.debug("{request.user.username}删除表{table_name}")
        return Response(status=status.HTTP_204_NO_CONTENT)

    # 获取当前用户
    @action(methods=['get'], url_path='get_my_info', detail=False)
    def get_my_info(self, request, *args, **kwargs):
        serializer = self.get_serializer(request.user)
        return Response(serializer.data)

    @action(methods=['post'], url_path='change_password', detail=False)
    def change_password(self, request, pk=None):
        serializer = self.get_serializer(data=request.data, context={"request", request})
        serializer.is_valid(raise_exception=True)
        request.user.set_password(serializer.validated_data["new_password"])
        request.user.save()
        return Response(status=status.HTTP_204_NO_CONTENT)


class AlertLogViewSet(mixins.ListModelMixin,
                  mixins.CreateModelMixin,
                  mixins.RetrieveModelMixin,
                  mixins.DestroyModelMixin,
                  mixins.UpdateModelMixin,
                  viewsets.GenericViewSet):
    # 按照日期排序
    queryset = AlertLog.objects.all().order_by('-created_date')
    serializer_class = AlertLogSerializer
    pagination_class = CPageNumberPagination

    # permission_classes = (permissions.IsAuthenticated, )

    # def get_serializer_class(self):
    #     if self.action == "change_password":
    #         return ChangePWSerializer
    #
    #     return super().get_serializer_class()

    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        return Response(serializer.data)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        logger.debug("{request.user.username}删除表{table_name}")
        return Response(status=status.HTTP_204_NO_CONTENT)


######################################
# RTSP流在线预览
######################################
def gen(url, id,point=[]):
  """Video streaming generator function."""
  camera = cv2.VideoCapture(url)
  if not camera.isOpened():
    exit()
  while True:
    _, img = camera.read()
    count, img = rfcn_show_pic_cv.processing(img, str(time.time()) + '.jpg')
    if _:
      # encode as a jpeg image and return it

      frame = cv2.imencode('.jpg', img)[1].tobytes()
      yield (b'--frame\r\n'
             b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

def video_feed(request):
    url = request.GET.get('url')
    id = request.GET.get('id')
    # url = 'rtsp://admin:Abcd1234@192.167.2.222:554'
    if not url:
        resp = {"result": "failed", "msg": "没有输入rtsp"}
        return HttpResponse(json.dumps(resp), content_type="application/json")
    # 解码
    url = urllib.parse.unquote(url)
    if url and not re.match(r'^rtsp:/{2}\w.+$', url):
        resp = {"result": "failed", "msg": "rtsp格式错误"}
        return HttpResponse(json.dumps(resp), content_type="application/json")
    # url = 'rtsp://admin:Grandhonor12306@192.167.2.222:554'
    # 视频流推送
    return StreamingHttpResponse(gen(url,id), content_type='multipart/x-mixed-replace; boundary=frame')