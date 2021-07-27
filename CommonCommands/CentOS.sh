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


