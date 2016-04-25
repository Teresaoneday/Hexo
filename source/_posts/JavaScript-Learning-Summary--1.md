---
title: JavaScript学习总结(一)---基础知识
date: 2016-3-27 20:22:33 
tags:
  - JavaScript
  - 学习总结
  - 
categories: JavaScript 
---
## 什么是JavaScript？
JavaScript一种直译式脚本语言，是一种动态类型、弱类型、基于原型的语言。简单地说，它是一种运行在浏览器中的解释型的编程语言。同时也是世界上最流行的脚本语言。

<!-- more -->

## JavaScript的运行机制
JavaScript在执行前，同一个作用域的代码会先解释再执行，浏览器引擎会自动扫描带var关键字和带function关键字声明的变量和定义的函数，这个过程称为预解释。
### var关键字预解释
先看如下代码：
```js
alert(n);//弹出undefined
var n = 10;
```
为什么结果是undefind？原因是代码执行前n会被声明，但是不会被赋值，相当于以下代码：
```js
var n;
alert(n);//弹出undefined
n = 10;
```
然后看以下代码：
```js
alert(n);
n = 10;
// 会报错 n is not defined
```
这次会报错的原因就是因为在代码运行时，并没有声明这个变量n，所以会报错。
### function关键字预解释
再看下如下代码：
```js
fn();//弹出hello
function fn(){
    alert('hello');
}
```
执行结果弹出hello，fn能够正常执行，原因是在代码执行前fn被预解释了，在预解释时已经将fn定义（defined）了
>所以得到如下结论：var用来声明变量，function用来定义函数，只不过function关键字声明和定义函数是同时执行的，而var它只能声明变量，并不具备定义的功能。
### 这算bug吗？（火狐除外）
```js
alert(n);
fn();
if(false) {
    var n = 10;
    function fn(){
        alert('hello');
    }
}
```
第一行代码执行会弹出undefined，第二行代码执行会弹出hello；是因为n和fn在代码执行前被预解释了，即使if条件判断为false，执着的浏览器引擎也会将带var关键字声明的变量n和带function关键定义的fn扫描到。
### 预解释忽略重新声明，不忽略重新定义
看如下代码：
```js
alert(n); // 弹出undefind
var n = 10;
var n = 9;
var n;
alert(n); // 弹出9
```
相当于如下代码：
```js
var n;
alert(n); // 弹出undefind
n = 10;
n = 9;
alert(n); // 弹出9
```
所以第一次会弹出undefind，而第二次会弹出9。
再看如下代码，分析结果：
```js
fn(); // 弹出2
function fn() {
    alert('1');
}
fn(); // 弹出2
function fn() {
    alert('2');
}
fn(); // 弹出2
```
前面的function会被后面的function重定义，所以三次调用`fn()`的结果都是弹出2