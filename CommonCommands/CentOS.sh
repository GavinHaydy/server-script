#防火墙状态
systemctl status firewalld

#启动防火墙
systemctl  start firewalld

#关闭防火墙
systemctl stop firewalld

#重启防火墙
systemctl restart firewalld

#查看指定端口是否开启  xx为端口号  /后为协议   tcp udp
firewall-cmd --query-port=xx/tcp

#开放端口  开放后需重启防火墙才能生效   后面加此参数永久生效 --permanent
firewall-cmd --add-port=xx/tcp

#查看进程 xxx 程序名
ps -x |grep xxx

#=================================================================================================================================
#docker 常用命令
#拉取镜像  以nginx为例
docker pull nginx
#删除镜像 rmi: remove image   xxx镜像名  镜像tag不为latest时必填
docker rmi xxx:tag
#查看镜像
docker images

#启动服务 参数 -p xx:xxx  端口映射   -v  xx:xxx 资源映射  -name  服务命名  --restart=always  自动重启 -d 后台运行
docker run xxx
#停服务
docker stop xxx
#删除服务
docker rm xxx
#查看服务  -a 参数 查看所有服务
docker ps

#下载文件 wget + 链接
wget http://nginx.org/download/nginx-1.13.7.tar.gz
访问网站 curl
curl www.baidu.com
