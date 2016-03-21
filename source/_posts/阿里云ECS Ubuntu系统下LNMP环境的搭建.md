---
title: 阿里云ECS Ubuntu系统下LNMP环境的搭建
tags:
  - 阿里云
  - Ubuntu
  - LNMP
categories: 服务器
---

## 前言

最近帮某公司做一个展示型网站，用的阿里云的ECS，虽然有各种LNMP一键安装包，但还是想自己跑一遍，顺便挖个坑记录一下以后配置服务器将会遇到的各种问题。言归正传，搭建了LNMP（Linux+Nginx+MySQL+PHP）网站服务器架构，服务器为阿里云服务器，系统为ubuntu13.04 64位。将要运行的应用为Wordpress网站程序。

备注：由于这几天一直有其他的事，当时没有写，也就没有截图，以后补上。

## 安装步骤

1.更新 ubuntu 的软件包安装源：
``` bash
$ sudo apt-get update
```
2.安装nginx，输入命令：
``` bash
$ sudo apt-get install nginx
```
3.安装MySQL，同样输入命令：
``` bash
$ sudo apt-get install  mysql-server
```
这里安装过程中会让你输入MySQL的root账户的密码（注意是MySQL的密码不是服务器的root密码）。

4.安装PHP，也是一条命令搞定：
``` bash
$ sudo apt-get install php5 php5-fpm php5-cli php5-cgi php5-mysql php5-gd
```
安装了一些php相关的组件。

## 配置软件

1.以root账户的权限进入数据库，输入密码
``` bash
$ mysql –u root –p
```
2.新建一个名为wordpress的数据库，并创建一个名为wpuser的用户，并将wordpress数据库授权给wpuser这个用户：
``` MySQL
mysql> create database wordpress;
mysql> grant all privileges on wordpress.* to wpuser@localhost identified by "password";
```
这里的password用你自己的密码代替。

3.配置nginx

先检查一下Nginx有没有正确安装，启动Nginx：
``` bash
$ sudo service nginx start
```

浏览器打开localhost:端口号，如果出现Welcome to Nginx！等信息，说明一切正常，可以开始下一步了。
nginx 的配置文件位于/etc/nginx/目录下，nginx的 配置文件是/etc/nginx/nginx.conf。打开默认配置文件：
我们可以看到nginx.conf文件的http{}模块里面有两行代码引用的外部文件:
``` bash
include /etc/nginx/conf.d/*.conf;
include /etc/nginx/sites-enabled/*;
```
这两行代码告诉我们conf.d文件夹下面所有以.conf结尾的文件和sites-enabled文件夹下面的所有文件都会被引用，所以我们可以把不同网站的配置文件放在这两个文件夹里面，而sites-enabled文件夹里面放的是sites-available文件夹下面的文件的软连接（相当于Windows里面的快捷方式），所以我们有三种方式来写我们网站的配置文件：
1>直接把配置文件写在niginx.conf文件的http{}模块下。
2>新建site.conf配置文件并将其放在conf.d文件夹下面。
3>进入sites-available文件夹，新建多个site文件（对应多个站点）放在sites-available文件夹下面，创建软连接链接到sites-enabled：
``` bash
$ cd /etc/nginx/sites-available
$ sudo vi wordpress
$ ln -s wordpress ../site-enabled/wordpress
```
5.4.配置nginx虚拟主机：
``` bash
$ sudo vi /etc/nginx/sites-available/default
```
server配置如下：
``` JavaScript
server {
        listen   80;
 
        root /var/www;
        index index.php index.html index.htm;
 
        server_name www.niices.com;
 
        location / {
                try_files $uri $uri/ /index.php?q=$uri&$args;
        }
 
        error_page 404 /404.html;
 
        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
              root /usr/share/nginx/www;
        }
 
        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        location ~ \.php$ {
                try_files $uri =404;
                #fastcgi_pass 127.0.0.1:9000;
                # With php5-fpm:
                fastcgi_pass unix:/var/run/php5-fpm.sock;
                fastcgi_index index.php;
                include fastcgi_params;
         }
}
```
检查你的nginx配置文件是否正确：
``` bash
$ nginx -t
```
如果打印出下面结果说明配置文件语法没有问题，具体业务需要自测：
![](http://niices.qiniudn.com/JCWT6XRIJ_%40640EZOEAY-300x41.png)
要让配置文件生效需要重新加载nginx服务:
``` bash
$ service nginx -s  reload
```
5.Wordpress的安装，将wordpress解压到配置文件规定的root目录（这里是/var/www），进行安装，安装的详细过程就不说了！