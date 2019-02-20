from kazoo.client import KazooClient

import time
import sys
import os
import django


# 初始化django
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))   # 把manage.py所在目录添加到系统目录
os.environ['DJANGO_SETTINGS_MODULE'] = 'backend.settings.dev'   # 设置setting文件
django.setup()   # 初始化Django环境

# 引入日志模块
from backend.api.models import Error

zk = KazooClient(hosts='192.167.1.18:2181')
zk.start()

# Determine if a node exists
while True:
    # 检查生产进程
    if not zk.exists("/producer"):
        zk.stop()
        # 重启进程
        zk.start()

        Error.objects.create(message="生产进程崩溃", type=3)

        print("the producer is dead!")

    else:
        print("the producer is alive!")

    if not zk.exists("/consumer"):
        zk.stop()
        # 重启进程
        zk.start()

        Error.objects.create(message="消费进程崩溃", type=3)

        print("the consumer is dead!")

    else:
        print("the consumer is alive!")

    time.sleep(60)

zk.stop()
