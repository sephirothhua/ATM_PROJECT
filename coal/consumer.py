# coding:utf8
import io
import avro.io
from kafka import KafkaConsumer
import time
import numpy as np
import cv2
from detection.gh_rfcn_python import rfcn_show_pic_cv
import django
import sys
import os
import uuid
from kazoo.client import KazooClient

dir_path = os.path.abspath(os.path.dirname(__file__))


# 初始化django
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))   # 把manage.py所在目录添加到系统目录
os.environ['DJANGO_SETTINGS_MODULE'] = 'backend.settings.dev'   # 设置setting文件
django.setup()   # 初始化Django环境

# 引入日志模块
from backend.api.models import Log, Error
from django.conf import settings

dst_path = os.path.join(settings.MEDIA_ROOT, 'tmp')

# 加载算法模块
rfcn_show_pic_cv.process_start()

# To consume messages
CONSUMER = KafkaConsumer('frame_tp', group_id='my_group', bootstrap_servers=['localhost:9092'])

SCHEMA_PATH = "frame.avsc"
SCHEMA = avro.schema.Parse(open(dir_path + '/' + SCHEMA_PATH, 'r').read())


def monitor(msg):
    # 解码
    bytes_reader = io.BytesIO(msg.value)
    decoder = avro.io.BinaryDecoder(bytes_reader)
    reader = avro.io.DatumReader(SCHEMA)

    # 获取kafka内的信息
    frame = reader.read(decoder)
    # rtsp = frame.get('rtsp')
    video_name = frame.get('videoName')
    video_number = frame.get('videoNumber')
    ibytes = frame.get('picContents')

    # 算法检测

    # bytes 转换为cv2
    nparr = np.fromstring(ibytes, np.uint8)
    img_np = cv2.imdecode(nparr, cv2.IMREAD_COLOR)  # cv2.IMREAD_COLOR in OpenCV 3.1

    # 算法识别
    count,img = rfcn_show_pic_cv.processing(img_np, str(time.time())+'.jpg')

    # cv2.imshow(video_name,img)
    # cv2.waitKey(1)
    # print(count)
    # 异常入库
    if count > 0:
        try:
            name = time.strftime('%Y-%m-%d %H:%M:%S') + '-' + str(uuid.uuid1()) + '.jpg'
            path = dst_path + '/' + name
            # print(path)
            # 图片存到本地
            cv2.imwrite(path, img_np)
            # 存储异常记录
            Log.objects.create(image_path='/media/tmp/' + name, status='1', camera_id=video_number)
        except Exception as e:
            Error.objects.create(message="camera: %s 存储异常图片错误" % video_name, type=2)
            # print(e)
    return count,img


if __name__ == '__main__':

    # 进程监控
    zk = KazooClient(hosts='192.167.1.18:2181')
    zk.start()

    # 创建进程结点
    zk.create("/consumer", value=bytes('consumer', encoding="utf8"), ephemeral=True)

    for msg in CONSUMER:
        # 检测图片
        monitor(msg)


