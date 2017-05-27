+++
title = "我是如何设置搭建这个博客的?"
date = "2017-05-27T16:10:32+08:00"
description = "我用 Vim 写 Markdown，Hugo 生成静态内容，Chrome 预览，用 Git 进行版本控制并存储博问和配置到 GitHub，用 TravisCI 构建并发布博文到 GitHub Pages。"
draft = true
+++

# 啰嗦一会
微博微信等软件用久了，对碎片化资讯便开始厌烦，仍想回到节奏稍慢的时代。

一直以来想自己动手搭博客写点东西。但由于各种事（jie）情（kou），一直没有搭好。万事开头难，
尝试过不少姿势搭建博客，好用的确实有很多，但顺心的直到最近才找到。

在一切都是刚刚开始之前，我对博客平台有下面一些期望：

* 美观
* 轻量，快速，简单
* 不需要租 VPS，免去配置和维护（其实是寒碜）
* 能将内容和配置存储，换一个地儿后能快速还原
* 容易 DIY 和 Hacking
* 支持 Markdown（格式易于控制和统一，显示代码也好看）
* 用 GitHub 托管和版本控制
* 能支持评论和分享就更好了

到这里就想到了 [GitHub Pages][gh-pages]，但 GitHub 官方主推 Jeklly。照着教程，在自己
机器上试了试，安装过程就很蓝瘦。终于装好后，生成网站时又出现了问题。Google 扒了好一阵，
在 Jekll GitHub Issue 中遇到有同样问题的人，按照上面给的方案，也并没有解决我的问题。
罢了，折腾之心已死，消停了几个月。

平时开发工作中，用 [Golang][go] 比较多，也知道 [Hugo][hugo] 的存在，但当时并不知道
Hugo 能够无缝支持 GitHub Pages。终于有一天还是发现了，惊喜，立刻安装试用起来。经过一
段时间摸索，现在一个像样的博客出锅了，就是你现在看到的模样！

如果像我一样，你也想按照这样的步骤写博文：

1. 用简单的文本编辑器（如 Vim、Atom）编写 Markdown 格式的文章；
2. 用 Hugo 快速生成静态内容，打开 Chrome 实时预览改动；
3. 用 Git 进行版本控制，并将博客配置、文章、主题、图片等文件提交到 GitHub；
4. 在 push 到 GitHub 后，TravisCI 默默生成网站，并发布到 GitHub Pages。

那么，接着阅读，这篇教程正合你意。


# 需要哪些东西？
先列一列炖这锅博客需要的原材料和烹饪技术：

* GitHub 帐号；
* TravisCI 帐号；
* 一台计算机（Linux / MacOS / Windows 都可以）；
* 熟悉控制台的使用；

[gh-pages]: https://pages.github.com/
[go]: https://golang.org/
[hugo]: https://gohugo.io
