#!/bin/bash
yum install -y docker-ce docker-ce-cli containerd.io

echo "==============================报错请运行 fix.sh======================="

echo"==========================================================================="
docker -v
systemctl start docker
