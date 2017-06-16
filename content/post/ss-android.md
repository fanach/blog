---
title: "Android 上使用 Shadowsocks 教程"
description: "在 Android 设备上安装 Shadowsocks、配置帐号，翻墙看世界！"
date: "2017-05-20"
categories:
  - "shadowsocks"
  - "vpn"
  - "android"
  - "tutorial"
tags:
  - "shadowsocks"
  - "vpn"
  - "android"
  - "tutorial"
---

<center>
<img src="android-icon.png"/>

Android
</center>

本文简要叙述 Android 设备中 Shadowsocks 客户端的安装、配置
和使用过程。

# 下载软件
下载 Android 版本 Shadowsocks 软件，叫 “影梭”，点击下载
[shadowsocks-nightly-3.3.1.apk][download-android-3.3.1] 。

# 安装运行
下载后安装 apk ，安装完成后打开 App 。

<center>
<img src="android-shadowsocks-01.png" width="320px"/>

图 1. Shadowsocks 图标
</center>

# 配置帐号
首次运行，根据提供的帐号信息，正确填写服务器地址、远程端口、密码和加密方式。

<center>
<img src="android-shadowsocks-02.png" width="320px"/>

图 2. 配置界面
</center>

然后点右上角圆形小飞机图标启用代理。

<center>
<img src="android-shadowsocks-03.png" width="320px"/>

图 3. 启用代理
</center>

# 验证是否成功
点击圆形小飞机上方 “检测网络连接”，如果测试连接有效，则配置正确。

打开任意浏览器，即可开始科学上网。

试试被墙网站：[Google][1]，[Twitter][2]，[YouTube][3]

<center>
<img src="android-shadowsocks-04.png" width="320px"/>

图 4. 打开 Twitter 试试
</center>

# 其他高级选项
部分高级设置项目，可参照下表修改。

<center>
表 1. 高级配置项
</center>

| 设置项 | 缺省值 | 推荐值 | 含义 |
|:--|:--|:--|:--|
| 本地端口 | 1080 | 保持缺省 | 本地监听端口，无需更改 |
| 加密方式 | AES-256-CFB | 保持缺省 | 传输时数据加密算法 |
| 一次性认证 | 未启用 | 保持缺省 |-|
| 路由 || 绕过局域网及中国大陆地址 |-|
| 远程 DNS|8.8.8.8 | 保持缺省 | DNS 服务器 |
|IPv6 路由 | 未启用 | 保持缺省 | 代理 IPv6 包 |
| 分应用代理 | 未启用 | 保持缺省 | 根据不同 APP 分别设置是否代理 |
|UDP 转发 | 未启用 | 保持缺省 | 代理 UDP 包 |
|KCP | 未启用 | 保持缺省 | 启用 KCP 加速 |
| 自动连接 | 未启用 | 启用 | 开机自动运行 |

# Tips

1. 注意加密方式为 AES-256-CFB ；
2. 部分机型在使用 Shadowsocks 之前，需要先安装或者更新 “谷歌服务框架”；
3. 为了防止 Shadowsocks 在内存优化时清理、或者熄屏省电时清理，请将其加入白名单；
4. 如果稳定性欠佳，建议尝试不同节点。

# 法律法规
帐号仅用于 ** 科学研究 ** 和 ** 学术交流 ** 用途，请务必遵守相关法规，转发敏感内容需要慎重。

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
* 2017.06.14 使用 3.3.1 版安卓客户端（无广告，界面与配图一致）；添加高级设置项说明。
* 2017.06.08 添加一些 Tips。
* 2017.06.04 移除多余错误文字（拷贝自 Windows 一文）。
* 2017.06.01 图片在移动设备上适配。
* 2017.05.30 添加网络安全法配图。
* 2017.05.29 修复下载链接。

[1]: https://google.com
[2]: https://twitter.com
[3]: https://youtube.com
[4]: https://youtube.com
[5]: http://www.miit.gov.cn/n1146295/n1146557/n1146614/c5345009/content.html
[download-android]: https://github.com/fanach/download/releases/download/latest/shadowsocks-nightly-4.1.7.apk
[download-android-3.3.1]: https://github.com/fanach/download/releases/download/latest/shadowsocks-nightly-3.3.1.apk
