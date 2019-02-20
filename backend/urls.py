"""project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
"""

from django.urls import include
from rest_framework import routers
from rest_framework_jwt.views import obtain_jwt_token
from .api.views import index_view, UserViewSet,video_feed
from .api.views import CameraViewSet, LogViewSet,AlertLogViewSet
from django.conf.urls import url
from django.contrib import admin
from django.views.static import serve
from .settings import dev


router = routers.DefaultRouter()
router.register('camera', CameraViewSet)
router.register('log', LogViewSet)
router.register('user', UserViewSet)
router.register('alert', AlertLogViewSet)


urlpatterns = [

    url(r'^api/token', obtain_jwt_token),

    url(r'^api/', include(router.urls)),

    url(r'^admin/', admin.site.urls),

    url(r'^view',video_feed,name='video_view'),

    url(r'^.*$', index_view, name='index'),

    url(r'media/(?P<path>.*)$', serve, {'document_root': dev.MEDIA_ROOT}),

]
