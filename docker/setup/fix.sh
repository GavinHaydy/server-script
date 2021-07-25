#!/bin/bash
echo ====================start repair=========================""
yum update -y

yum install -y yum-utils #管理yum源

yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo #添加yum源

yum makecache fast #更新索引

yum install -y epel-release #阿里云上的epel源
yum install -y  container-selinux
echo "===============please run   sh docker.setup.sh=============="
