#!/bin/bash
echo ====================start repair=========================""

yum install -y epel-release #阿里云上的epel源
yum install -y  container-selinux
echo "===============please run   sh docker.setup.sh=============="
