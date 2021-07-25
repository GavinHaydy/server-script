#!/bin/bash
#创建存放目录
mkdir -p /data/wwwroot/jenkins
cd /data/wwwroot/jenkins

#下载jenkins的war包
wget https://mirrors.tuna.tsinghua.edu.cn/jenkins/war/2.303/jenkins.war

nohup java -jar jenkins.war >jenkins.log 2>&1  & 
ps -x|grep jenkins
