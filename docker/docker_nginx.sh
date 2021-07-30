#!/bin/bash
echo "==============================wrote by The-Ruffian======================"
mkdir -p /data/wwwroot/nginx
cd /data/wwwroot/nginx
echo -e "FROM nginx:latest\nMAINTAINER the-ruffian">Dockerfile
docker build -t nginx:1 .
echo "===============================build SUCCESS============================="
docker rmi nginx
docker images
