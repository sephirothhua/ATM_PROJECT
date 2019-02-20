import io
import cv2
import time
import os

import avro.schema
from avro.io import DatumWriter
from kafka import SimpleProducer
from kafka import SimpleClient
from kazoo.client import KazooClient
import threading
import django
import sys


# 初始化django
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))   # 把manage.py所在目录添加到系统目录
os.environ['DJANGO_SETTINGS_MODULE'] = 'backend.settings.dev'   # 设置setting文件
django.setup()   # 初始化Django环境

# 引入缓存模块
from django.core.cache import cache
# 引入设备
from backend.api.models import Camera, Error
import logging

dir_path = os.path.abspath(os.path.dirname(__file__))

# To send messages synchronously
KAFKA = SimpleClient('localhost:9092')
PRODUCER = SimpleProducer(KAFKA)

# Kafka topic
TOPIC = "frame_tp"

# Path to frame.avsc avro schema
SCHEMA_PATH = "frame.avsc"
SCHEMA = avro.schema.Parse(open(dir_path + "/" + SCHEMA_PATH, 'r').read())

logger = logging.getLogger("django")
# # 缓存数据
# if cache.get('camera_rtsp'):
#     data_list = cache.get('camera_rtsp')
# else:
#     data_list = Camera.objects.all().values_list("rstp", "name", "id")
#     cache.set('camera_rtsp', data_list)
# data_list = [
#   ("rtsp://184.72.239.149/vod/mp4://BigBuckBunny_175k.mov", 'test1', 1),
#   ("rtsp://admin:Grandhonor12306@192.167.2.222:554", 'test2', 2),
#
# ]
data_list = Camera.objects.all().values_list("rstp", "name", "id")

# 视频流读取图片
def read_pic(rstp, video_name, video_number):
    try:
        cap = cv2.VideoCapture(rstp)
        ret, frame = cap.read()
        i = 0
        if ret:
            # 记录正常状态
            Camera.objects.filter(id=video_number).update(status=0)
        while ret:
            i += 1
            ret, frame = cap.read()
            # 十帧抓取
            if i % 10 == 0:
                # logger.info('video_name:' + video_name + ', i_frame:' + i)
                # print('video_name:' + video_name)
                # 转换为bytes
                success, encoded_image = cv2.imencode('.jpg', frame)
                content = encoded_image.tobytes()
                # 推入kafka
                put_frame(video_name, video_number, content)
        else:
            # 读取视频流出错 记录异常
            Error.objects.create(message="camera: %s 视频流抓取为空" % video_name, type=1)
            Camera.objects.filter(id=video_number).update(status=1)
    except Exception as e:
        # 读取视频流出错 记录异常
        Error.objects.create(message="camera: %s 视频流读取错误" % video_name, type=1)
        Camera.objects.filter(id=video_number).update(status=1)


# 放入kafka
def put_frame(video_name, video_number, pic):
    writer = DatumWriter(SCHEMA)
    bytes_writer = io.BytesIO()
    encoder = avro.io.BinaryEncoder(bytes_writer)
    writer.write({"rtsp": "rtsp",
                  "createTime": time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time())),
                  "videoName": video_name,
                  "videoNumber": video_number,
                  "picContents": pic
                  }, encoder)
    raw_bytes = bytes_writer.getvalue()
    PRODUCER.send_messages(TOPIC, raw_bytes)


# 检查线程
def check_thread(sleeptimes=180, initThreadsName=[]):
    while True:
        nowThreadsName = []  # 用来保存当前线程名称
        now = threading.enumerate()  # 获取当前线程名
        for i in now:
            nowThreadsName.append(i.getName())  # 保存当前线程名称

        for index in initThreadsName:
            if index in nowThreadsName:
                pass  # 当前某线程名包含在初始化线程组中，可以认为线程仍在运行
            else:
                t = threading.Thread(target=read_pic, args=(data_list[int(index)]))  # 重启线程
                t.setName(index)  # 重设name
                t.start()
        time.sleep(sleeptimes)  # 隔一段时间重新运行，检测有没有线程down


if __name__ == '__main__':

    print(os.getpid())
    # 进程监控
    zk = KazooClient(hosts='192.167.1.18:2181')
    zk.start()

    # 创建进程结点
    zk.create("/producer", value=bytes('producer', encoding="utf8"), ephemeral=True)

    # 多线程
    thread_list = []

    for i in range(len(data_list)):
        t = threading.Thread(target=read_pic, args=(data_list[i]))
        thread_list.append(t)
        t.setName(i)

    for j in thread_list:
        j.start()

    initThreadsName = ['Thread:check']  # 保存初始化线程组名字

    init = threading.enumerate()  # 获取初始化的线程对象
    for i in init:
        initThreadsName.append(i.getName())  # 保存初始化线程组名字

    check = threading.Thread(target=check_thread, args=(60, initThreadsName))  # 用来检测是否有线程down并重启down线程
    check.setName('Thread:check')
    check.start()
