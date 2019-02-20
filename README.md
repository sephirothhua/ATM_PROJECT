## 使用步骤
1.配置安装node.js

2.配置安装npm

3.安装requirements里面的python包

4.进行下列编译
## Build Setup

``` bash
# install dependencies
cnpm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

## django创建数据库及超级管理员
```
python3 manage.py makemigrations
python3 manage.py migrate #创建数据库
python3 manage.py createsuperuser #创建超级管理员
```

## 安装包注意事项
+ coal/detection/gh_rfcn_python/gh_rfcn_python_interface 需要setup进行安装
+  detection下需要根据环境重新进行makefile

## 安装kafka
+ http://kafka.apache.org/downloads.html 下载二进制包
+ 解压进入文件夹
+ 安装jdk环境
```
sudo apt-get install openjdk-8-jdk
```
+ 启动Zookeeper
```
bin/zookeeper-server-start.sh config/zookeeper.properties &
```
+ 启动Kafka：
```
bin/kafka-server-start.sh config/server.properties &
```
+ topic创建
```
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
```
+ 生产者测试
```
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
```
+ 消费者测试
```
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
```