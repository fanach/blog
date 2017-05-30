---
title: "Macbook 上使用 Shadowsocks 教程"
description: "在 macOS 设备上安装 Shadowsocks、配置帐号，翻墙看世界！"
date: "2017-05-20"
categories:
  - "shadowsocks"
  - "vpn"
  - "mac"
  - "tutorial"
tags:
  - "shadowsocks"
  - "vpn"
  - "mac"
  - "tutorial"
---

<center>
<img src="mac-icon.png"/>

Macbook
</center>

本文简要叙述 macOS 设备中 Shadowsocks 客户端的安装、配置和使用过程。

# 下载软件
下载 macOS 上的 Shadowsocks 软件，点击下载 [ShadowsocksX-2.6.3.dmg][download-mac] 。

# 安装运行
打开下载的 dmg 文件，将程序图标拖到右边的 Applications，安装完成

<center>
<img src="mac-shadowsocks-01.png" width="640px"/>

安装Shadowsocks
</center>

# 配置帐号
进入Launchpad，打开ShadowsocksX程序，程序图标出现在右上方，点击
图标 - “服务器” - “服务器设定”。

<center>
<img src="mac-shadowsocks-02.png" width="400px"/>

打开配置
</center>

根据提供的帐号信息，正确填写服务器地址（IP 或域名）、远程端口、加密方式和密码。

<center>
<img src="mac-shadowsocks-03.png" width="500px"/>

配置界面
</center>

选择刚刚配置好的服务器，点“打开Shadowsocks”，完成设置。

<center>
<img src="mac-shadowsocks-04.png" width="500px"/>

启用代理
</center>


# 验证是否成功
打开 Safari 或 Chrome，无需设置，开始科学上网

试试被墙网站：[Google][1]，[Twitter][2]，[YouTube][3]

<center>
<img src="mac-shadowsocks-05.png" width="640px"/>

打开 YouTube 试试
</center>

# Tips

1. 第一次配置后，记得点击“从 GFW 更新 PAC”，将会联网更新被墙的网站列表，
这样被墙的网站才走代理，如果有些网站打不开就试试“全局模式”；

2. 注意加密方式选择 AES-256-CFB；

3. 如果稳定性欠佳，建议尝试不同节点。

# 法律法规
帐号仅用于**科学研究**和**学术交流**用途，请务必遵守相关法规，转发敏感内容需要慎重。

<center>
<img src="ss-law.png" width=600/>
</center>

任何个人和组织使用网络应当遵守宪法法律，遵守公共秩序，尊重社会公德，不得危害网络安全，
不得利用网络从事危害国家安全、荣誉和利益，煽动颠覆国家政权、推翻社会主义制度，煽动分裂
国家、破坏国家统一，宣扬恐怖主义、极端主义，宣扬民族仇恨、民族歧视，传播暴力、淫秽色情
信息，编造、传播虚假信息扰乱经济秩序和社会秩序，以及侵害他人名誉、隐私、知识产权和其他
合法权益等活动。

附：《[中华人民共和国网络安全法][5]》

[1]: https://google.com
[2]: https://twitter.com
[3]: https://youtube.com
[4]: https://youtube.com
[5]: http://www.miit.gov.cn/n1146295/n1146557/n1146614/c5345009/content.html
[download-mac]: https://github.com/fanach/download/releases/download/latest/ShadowsocksX-2.6.3.dmg
