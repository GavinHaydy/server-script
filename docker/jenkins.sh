#!bin/bash

#编写Dockerfile
echo -e "FROM jenkins/jenkins:latest\nMAINTAINER the-ruffian">Dockerfile

#根据Dockerfile编译镜像
docker build -t jenkins .

#创建Jenkins挂载目录并授权权限 便于后期修改配置
mkdir -p /data/wwwroot/jenkins_mount
chmod 777 /data/wwwroot/jenkins_mount

#创建并启动jenkins容器

docker run -d --restart=always -p 18080:8080 -p 50000:50000 -v /data/wwwroot/jenkins_mount:/var/jenkins_home -v /etc/localtime:/etc/localtime --name jenkins docker.io/jenkins/jenkins

#-d 后台运行镜像
#--restart=always   自动重启
#-p 18080:8080 将镜像的8080端口映射到服务器的18080端口。
#-p 50000:50000 将镜像的50000端口映射到服务器的50000端口
#-v /data/wwwroot/jenkins_mount:/var/jenkins_home
# /var/jenkins_home目录为容器jenkins工作目录，我们将硬盘上的一个目录挂载到这个位置，方便后续更新镜像后继续使用原来的工作目录。这里我们设置的就是上面我们创建的 /data/wwwroot/jenkins_mount目录
#-v /etc/localtime:/etc/localtime让容器使用和服务器同样的时间设置。
#--name jenkins 给容器起一个别名

#查看jenkins是否启动成功
docker ps -l

# 查看日志
docker logs jenkins

#配置镜像加速，将默认源修改为清华源

echo -e "<?xml version='1.1' encoding='UTF-8'?>\n<sites>\n  <site>\n    <id>default</id>\n    <url>https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json</url>\n  </site>\n</sites>">/data/wwwroot/jenkins_mount/hudson.model.UpdateCenter.xml

#jenkins默认密码
cat /data/wwwroot/jenkins_mount/secrets/initialAdminPassword