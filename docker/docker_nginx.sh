#!/bin/bash
echo "==============================wrote by The-Ruffian======================"
mkdir -p /data/wwwroot/nginx
cd /data/wwwroot/nginx
mkdir -p {conf,html,logs,cert}

echo "============================================================"
docker run -d --name nginx -p 8080:8080 nginx
docker cp nginx:/etc/nginx/mimie.types ./cert/
docker cp nginx:/etc/nginx/nginx.conf ./
docker cp nginx:/etc/nginx/conf.d/default.conf ./conf/
docker stop nginx
docker rm -f nginx

echo "==========================================================start nginx============================================================="
docker run -d --name nginx -p 18080:80 -p 443:443 --restart=always -v /data/wwwroot/nginx/cert:/etc/nginx/ -v /data/wwwroot/nginx/nginx.conf:/etc/nginx/nginx.conf -v /data/wwwroot/nginx/logs:/var/log/nginx -v /data/wwwroot/nginx/html/:/usr/share/nginx/html -v /data/wwwroot/nginx/conf/:/etc/nginx/conf.d --privileged=true nginx
docker ps

#docker run -d  后台运行
# --name nginx  服务取名
# -p 8089:80  端口映射
#-v /data/wwwroot/nginx/cert:/usr/local/software/nginx/cert  证书资源挂载
# -v /data/wwwroot/nginx/nginx.conf:/etc/nginx/nginx.conf 全局配置挂载
#-v /data/wwwroot/nginx/logs:/var/log/nginx 日志挂载
#-v /data/wwwroot/nginx/html/:/usr/share/nginx/html  资源挂载
#-v /data/wwwroot/nginx/conf/:/etc/nginx/conf.d 配置挂载（default.conf）
#--privileged=true 容器内部对挂载的目录拥有读写等特权
#nginx 要启动的镜像名
