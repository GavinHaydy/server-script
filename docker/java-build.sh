#!/bin/bash
echo "====================write by The-Ruffian===================="

#生成Dockerfile
echo -e "FROM java:latest\nMAINTAINER the-ruffian\nADD demo-0.0.1-SNAPSHOT.jar bug-pz.jar\nEXPOSE 80 ENTRYPOINT ['java','-jar','bug-pz.jar']"
docker build -t java1 .
docker run -d --restart=always -name java -p 80:80 java1

#-d 后台运行
#--restart 重启机制
#-name 服务别名
#-p 端口映射
#java1 镜像名