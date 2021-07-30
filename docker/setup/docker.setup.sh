#!/bin/bash
yum update -y

yum install -y yum-utils #管理yum源

yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo #添加yum源

yum makecache fast #更新索引

yum install -y docker-ce

echo "==============================报错请运行 fix.sh======================="

echo"==========================================================================="
docker -v
systemctl start docker
