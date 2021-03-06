---
title: "Windows 上使用 Shadowsocks 教程"
description: "在 Windows 设备上安装 Shadowsocks、配置帐号，翻墙看世界！"
date: "2017-07-06"
categories:
  - "shadowsocks"
  - "vpn"
  - "windows"
  - "tutorial"
tags:
  - "shadowsocks"
  - "vpn"
  - "windows"
  - "tutorial"
---

<center>
<img src="windows-icon.png"/>

Windows
</center>

本文简要叙述 Windows 下（适用于 Windows XP，7，8，10）Shadowsocks 客户端的安装、配置
和使用过程。

# 下载软件
下载 Windows 下的 Shadowsocks 软件，点击下载 [shadowsocks-2.5.8.zip][download-windows] 。

# 解压运行
下载后解压，解压后运行 Shadowsocks 。

<center>
<img src="windows-shadowsocks-01.png"/>

图 1. Shadowsocks 图标
</center>

# 配置帐号
首次运行，会弹出编辑服务器窗口，根据提供的帐号信息，正确填写服务器地址、端口、密码
和加密方式，然后点确定。

<center>
<img src="windows-shadowsocks-02.png" width="80%"/>

图 2. 配置界面
</center>

点确定后，右下角弹出提示。

<center>
<img src="windows-shadowsocks-03.png" width="80%"/>

图 3. 任务栏图标
</center>

右键程序图标，弹出主菜单，勾选 “启用系统代理”。

<center>
<img src="windows-shadowsocks-04.png" width="80%"/>

图 4. 启用 Shadowsocks
</center>

# 验证是否成功
打开任意浏览器（IE / Chrome / Firefox 等），即可开始科学上网。

试试被墙网站：[Google][1]，[Twitter][2]，[YouTube][3]

<center>
<img src="windows-shadowsocks-05.png" width="95%"/>

图 5. 打开 Twitter 试试
</center>

# Tips

1. 如果软件无法运行，弹出需要安装 .net ，请前往微软官网安装对应系统的 .net；
2. 加密方式（算法）默认为 aes-256-cfb；
3. 验证时，先用 IE 打开测试，出问题的可能小，其他浏览器注意代理插件的相关设置；
5. 首次运行后，点击 “从 GFWlist 更新本地 PAC 文件” ，然后设置代理模式为 “PAC 模式”，
这样对被墙网站会自动启用代理；
4. 如果无法连接，试试切换到 “全局代理” 模式；
6. 如果稳定性欠佳，尝试切换不同节点。


# 法律法规
帐号仅用于 **科学研究** 和 **学术交流** 用途，请务必遵守相关法规，转发敏感内容需要慎重。

<center>
<img src="ss-law.png" width="95%"/>
</center>

任何个人和组织使用网络应当遵守宪法法律，遵守公共秩序，尊重社会公德，不得危害网络安全，
不得利用网络从事危害国家安全、荣誉和利益，煽动颠覆国家政权、推翻社会主义制度，煽动分裂
国家、破坏国家统一，宣扬恐怖主义、极端主义，宣扬民族仇恨、民族歧视，传播暴力、淫秽色情
信息，编造、传播虚假信息扰乱经济秩序和社会秩序，以及侵害他人名誉、隐私、知识产权和其他
合法权益等活动。

附：《[中华人民共和国网络安全法][5]》

# 修改历史
* 2017.06.16 调节空格与缩进。
* 2017.06.08 添加 tips 信息。
* 2017.06.16 调节空格与缩进。
* 2017.05.30 适配图片到移动设备。

[1]: https://google.com
[2]: https://twitter.com
[3]: https://youtube.com
[4]: https://youtube.com
[5]: http://www.miit.gov.cn/n1146295/n1146557/n1146614/c5345009/content.html
[download-windows]: https://github.com/fanach/download/releases/download/latest/shadowsocks-2.5.8.zip
