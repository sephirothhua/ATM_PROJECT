bind = "0.0.0.0:8082"
workers = 2  # workers是工作线程数，一般设置成：服务器CPU个数 + 1
errorlog = '/data/map/gunicorn.error.log'
daemon = True  # 守护进程
worker_class = "gevent"
threads = 16
forworded_allow_ips = '*'
reload = True
worker_connections = 2000
timeout = 1500
# preload_app = True  # 预加载应用程序

'''
start command:
gunicorn -c /data/map/backend/gunicorn.conf.py backend.wsgi:application
'''

