---
title: MAC下npm常见错误处理
date: 2016-8-27 20:22:33  
tags:
  - npm install
  - 常见错误
  - MAC
categories: 
---

## 前言

记录一下使用`npm`出现的常见错误。

## 全局安装权限报错

有时候我们全局安装（-g）的时候会出现没有写入权限的问题。
虽然我们可以通过`sudo`命令来暂时解决问题，但是这并不是`npm`官方推荐的方式。

官方推荐如下三种解决方式：

### 改变`npm`默认文件夹的权限

我们先看一下`npm`默认文件夹的位置：

```
npm config get prefix
```

如果是`/usr/local`则继续下一步，否则可以考虑其它两种解决方式。

修改`npm`默认文件夹的权限，使当前账户能进行读写操作:

```
sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}
```

### 修改`npm`默认文件夹到其他文件夹

新建一个隐藏文件夹：

```
mkdir ~/.npm-global
```

将默认文件夹修改到上面新建的文件夹：

```
npm config set prefix '~/.npm-global'
```

新建或者打开`~/.profile`文件，添加如下代码：

```
export PATH=~/.npm-global/bin:$PATH
```

更新系统变量：

```
source ~/.profile
```

现在我们可以测试不用`sudo`命令全局安装一个`npm`包了：

```
npm install -g jshint
```

### 使用包管理器进行安装

比如，使用`Homebrew`安装的`node`环境就没有这个问题。

```
brew install node
```

### 参考来源

[Fixing npm permissions](https://docs.npmjs.com/getting-started/fixing-npm-permissions#option-1-change-the-permission-to-npms-default-directory)