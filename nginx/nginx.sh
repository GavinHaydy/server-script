#!/bin/bash
echo "start install nginx"
echo "========================================================================="
yum install -y openssl-devel bzip2-devel expat-devel gdbm-devel readline-devel sqlite-devel psmisc libffi-devel
yum -y install wget
yum -y install gcc gcc-c++ autoconf automake make
cd /home
wget http://nginx.org/download/nginx-1.13.7.tar.gz
tar -zxvf nginx-1.13.7.tar.gz
cd nginx-1.13.7
./configure
make
make install
cp /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.bak
echo "==================测试========================"
/usr/local/nginx/sbin/nginx -t
