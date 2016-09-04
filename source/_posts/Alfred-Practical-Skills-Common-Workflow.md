---
title: Alfred实用技巧汇总及常用Workflow推荐
date: 2016-8-22 20:22:33  
tags:
  - Workflow
  - Alfred
  - Mac
categories: Mac
---

## 前言

`Alfred`是一款`Mac`独有的效率软件，很多人都用它来代替`Mac`自带的`Spotlight`和`Launchpad`来启动应用，其基础功能是免费的。当然我个人认为其最为核心的功能还在于`Workflows`上，可以帮我们自动，快捷，装bility的处理各种任务。当然要用`Alfred`的`Workflows`，首先你需要`Alfred`这个软件，没有的可以点击[Alfred](https://www.alfredapp.com/)下载，并还要大家自行购(po)买(jie)它的`Powerpack`。
本文主要介绍`Alfred`的一些实用技巧和我常用的一些`Workflow`。

<!-- more -->

## 实用技巧

常用的我就不说了，说一点比较偏的吧。强迫症患者福音:)

### 修改`Alfred`的默认搜索引擎

`Alfred`默认情况下提供了如下三个搜索引擎：`Google`，`Amazon`和`Wikipedia`。
看起来是这样的：

![](/images/2016/08/8.png)

`Google`我就忍了，`Amazon`和`Wikipedia`平时根本用不到，完全是在扎我眼睛啊！所以我把它换成了`Google`，`Baidu`和`Bing`。
首先我们进入`Alfred`的偏好设置（Command+,）->Features->Web Search->Add Custom Search（右下角）添加百度搜索引擎。
依次输入Search Url：`https://www.baidu.com/s?wd={query}`，Title：`Search Baidu for '{query}'`和`baidu`如图：

![](/images/2016/08/9.png)

然后点击Features->Default Result->Set fallback results（左下角），如图：

![](/images/2016/08/10.png)

点击`-`删除默认`Amazon `和`Wikipedia`，然后点击`+`添加`Bing`（Web Search）和`Baidu`（Custom Search）。

保存之后就可以看到效果了:)

### 在`Alfred`输入框中切换中英文输入(shift)

默认在`Alfred`输入框中按`shift`会预览当前选定的第一条条目。这个功能我用的不多，而且`Command+Y`也可以触发。
点击Features->File Search->Advanced 设置，将`Quick Look`取消勾选。然后我们就可以在输入框使用`shift`切换中英文输入了！

### 支持更多文件格式的搜索

在配置的时候，最理想的是只将自己期望检索的内容放入搜索域（Search Scope）中，这里不推荐大家搜索所有类型的文件（Search all file types）。因为这样搜索出来的结果不仅速度慢，而且搜索结果质量非常之差，会搜出很多系统生成的文件信息等。
`Alfred`默认支持搜索的文件类型很少，比如`json`和`md`格式就不支持，我们就可以点击Features->Default Results->Advanced，将我们所要检索的文件类型拖入。

![](/images/2016/08/11.png)

## 常用Workflow

### DS_Store Cleaner

见名知义，这个`Workflow`是用来删除当前文件夹下`Mac`系统自动生成的`.DS_Store`（用来存储当前文件夹的显示属性）文件的。

`Mac`默认生成的`.DS_Store`文件不仅会在跟`Windows`系统交换文件的时候显得很多余，更多的时候它会影响代码的执行（比如：`Hexo`运行时如果主题里面有`.DS_Store`文件时就会报未知错误）。

Triggers：dsc

![](/images/2016/08/12.png)

下载地址：[戳这里](https://raw.githubusercontent.com/niices/Alfred-Workflows/master/DS_Store%20Cleaner.alfredworkflow)

### Encode / Decode

几种常见的编码/解码方式，不要太方便。

Triggers：encode/decode

![](/images/2016/08/13.png)

下载地址：[戳这里](https://raw.githubusercontent.com/niices/Alfred-Workflows/master/Encode%20:%20Decode.alfredworkflow)

### Hidden Files

显示或隐藏Finder中的隐藏文件。

Triggers：hide

![](/images/2016/08/14.png)

![](/images/2016/08/15.png)

下载地址：[戳这里](https://raw.githubusercontent.com/niices/Alfred-Workflows/master/Encode%20:%20Decode.alfredworkflow)

### Kill Process

搜索并杀掉指定进程。

Triggers：kill

![](/images/2016/08/16.png)

下载地址：[戳这里](https://raw.githubusercontent.com/niices/Alfred-Workflows/master/Kill%20Process.alfredworkflow)

### New File

在当前目录下新建文件（nf）或者新建并打开文件（nfo）。关键词后面跟上空格+文件名+文件类型，如果文件类型省略，则默认为`.txt`类型。

Triggers：nf/nfo

![](/images/2016/08/17.png)

下载地址：[戳这里](https://raw.githubusercontent.com/niices/Alfred-Workflows/master/Kill%20Process.alfredworkflow)

### Open with Sublime Text

在Sublime Text 3（2没有测试过）编辑器中打开当前文件或文件夹（os），或者搜索并打开文件或者文件夹（fos）（需要在关键词后面跟上空格+文件名/文件夹名）。

Triggers：os/fos

![](/images/2016/08/18.png)

![](/images/2016/08/19.png)

下载地址：[戳这里](https://raw.githubusercontent.com/niices/Alfred-Workflows/master/Open%20with%20Sublime%20Text.alfredworkflow)

### TerminalFinder

打开当前`Finder/Path Finder`目录到终端`Terminal/iTerm`或者在终端`Terminal/iTerm`打开当前`Finder/Path Finder`目录

Triggers：

`ft`: Finder -> Terminal
`tf`: Terminal -> Finder
`fi`: Finder -> iTerm
`if`: iTerm -> Finder
`pt`: Path Finder -> Terminal
`tp`: Terminal -> Path Finder
`pi`: Path Finder -> iTerm
`ip`: iTerm -> Path Finder

![](/images/2016/08/20.png)

下载地址：[戳这里](https://raw.githubusercontent.com/niices/Alfred-Workflows/master/TerminalFinder.alfredworkflow)

## 参考来源
[如何修改alfred的默认搜索引擎？](http://www.zhihu.com/question/22055110)
[Alfred 如何取消Shift预览](https://www.v2ex.com/t/75635)
[alfred-terminalfinder-github](https://github.com/LeEnno/alfred-terminalfinder)