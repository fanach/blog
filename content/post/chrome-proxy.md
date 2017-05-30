+++
title = "为 Chrome / Chromium 设置 SOCKS5 代理"
date = "2017-05-30"
+++

<center>
<img src="chrome-chromium.jpg"/>

Chrome / Chromium
</center>

本文简要介绍 Chrome / Chromium 浏览器中 SwitchyOmega 插件的安装、配置和代理切换过程。

## 下载 SwitchyOmega
Chrome / Chromium 可以用 SwitchyOmega 插件智能切换代理。

<center>
<img src="chrome-proxy-01.png" width=640/>

图1. SwitchyOmega
</center>

到 Crx4Chrome 下载 [SwitchyOmega][crxdown]，或者直接点击
下载 [SwitchyOmega.2.4.6.crx][crxdown2]。

## 安装 Crx
打开 Chrome 插件管理页面，另一侧打开 SwitchyOmega 的下载目录。拖动 SwitchyOmega 文件
到 Chrome 插件页面中。

<center>
<img src="chrome-proxy-02.png" width=640/>

图2. 安装 SwitchyOmega
</center>

在弹出提示页面，确定安装。之后 SwitchyOmega 配置页面将自动打开。

<center>
<img src="chrome-proxy-03.png" width=720/>

图3. SwitchyOmega 配置页
</center>

# SwitchyOmega 设置

点 “Skip Guide” 跳过向导，然后选择点击左侧 “proxy”，选择代理类型为 “SOCKS5”，
设置服务器为 `127.0.0.1`，端口为 `1080`（本地端口），最后点左下方 “Apply changes” 保存。

<center>
<img src="chrome-proxy-04.png" width=720/>

图4. 设置 SwitchyOmega
</center>

最后，在控件栏找到 SwitchyOmega 。

<center>
<img src="chrome-proxy-05.png" width=480/>

图5. 启用代理
</center>

点击在弹出菜单里选择 “proxy”，是全局代理，国内外流量都走代理。

<center>
<img src="chrome-proxy-06.png" width=480/>

图6. 选择代理
</center>

这里想要智能切换，就选择 “auto switch”，然后对于无法访问的被墙网站，选择 “proxy”，
对于国内的网站，仍用 “direct” 直接连接。（我这里不好截图，拍的渣图凑合看，后面再换上。）

<center>
<img src="chrome-proxy-07.png" width=480/>

图7. 配置自动切换
</center>

# 验证是否成功

打开新的窗口里，开始科学上网。

试试被墙网站：[Google][google]，[Twitter][twitter]，[YouTube][youtube]。

<center>
<img src="chrome-proxy-08.png" width=720/>

图8. 打开 Google 试试
</center>

如果连接不成功，重新检查 Shadowsocks 帐号设置和 SwitchyOmega 配置。


[crxdown]: https://www.crx4chrome.com/crx/998/
[crxdown2]: https://github.com/fanach/download/releases/download/latest/SwitchyOmega.2.4.6.crx
[google]: https://google.com
[twitter]: https://twitter.com
[youtube]: https://youtube.com
