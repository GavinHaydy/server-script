#!/bin/bash
echo "====================wrote by The-Ruffian===================="

docker pull java:8

mkdir /data/java-web/{jar,logs}
cd /data/java-web/jar
# jar包放在/data/java-web/jar此路径下

docker run -d --restart=always -v /data/java-web/jar:/jar -v /data/java-web/logs:/mnt/logs/ -p 80:80 --name java-web  java:8 java -jar -Duser.timezone=GTM+08 /jar/demo-0.0.1-SNAPSHOT.jar java:8

#docker run -d --restart=always -v /data/java-web/jar/:/jar -v /data/java-web/logs/:/mnt/logs/ -p 80:80 -name java-web  jdk8 /usr/bin/java -jar  /jar/xxx
#-d 后台运行
#-v 挂载资源
#-p 端口映射
#--name 服务别名
#java:8 java -jar -Duser.timezone=GTM+08 /jar/demo-0.0.1-SNAPSHOT.jar 使用java启动jar包
# -Duser.timezone=GTM+08设置时区
#/jar/demo-0.0.1-SNAPSHOT.jar  jar包名  根据实际情况修改
#java:8 镜像名

#此方法无需每次发版都编译未镜像，只需替换物理机/data/java-web/jar下的jar包就行

docker logs -f java-web   #查看日志

