---
title: "Linux 上使用 Shadowsocks 教程"
date: "2017-07-06"
---

<center>
<img src="linux-icon.svg" width=128/>

Linux
</center>

本文简要叙述 Linux 设备中 Shadowsocks 客户端的安装、配置和使用过程。

# 下载软件

下载 Linux 上的通用 Shadowsocks 软件，点击下载 [shadowsocks-local-linux32-1.1.5.gz][linux-download] 。

> 这是一个 Go 语言版的 32 位与 64 位通用二进制客户端。源程序见 GitHub [shadowsocks/shadowsocks-go][ss-src]

如果没有可视化浏览器，那么可以用在命令行下载。

```sh
wget https://github.com/fanach/download/releases/download/latest/shadowsocks-local-linux32-1.1.5.gz
```

<center>
<img src="linux-shadowsocks-01.png" width="95%"/>

图 1. Linux 下载 Shadowsocks
</center>

# 解压与安装

下载后，得到 `shadowsocks-local-linux32-1.1.5.gz`，用 gzip 解压。

接着，增加可执行权限。
```sh
$ gzip -d shadowsocks-local-linux32-1.1.5.gz

$ chmod +x shadowsocks-local-linux32-1.1.5
```

<center>
<img src="linux-shadowsocks-02.png" width="95%"/>

图 2. 解压与添加权限
</center>

# 运行
查看运行参数。

<center>
<img src="linux-shadowsocks-03.png" width="95%"/>

图 3. 运行参数
</center>


根据提供的帐号信息，替换下面命令中的服务器地址、服务器端口和密码，本地端口设为 `1080`。

```sh
$ ./shadowsocks-local-linux32-1.1.5 -s 112.113.114.115 -p 8388 -k abc123 -l 1080
```

上面命令中，`112.113.114.115` 为服务器地址，`8388` 为服务器端口，`abc123` 为密码，
`1080` 为本地端口。

<center>
<img src="linux-shadowsocks-04.png" width="95%"/>

图 4. 运行 Shadowsocks
</center>

启动后，将在本地 `127.0.0.1:1080` 代理请求到服务端。

# 配置代理

如果有可视化浏览器，进入浏览器设置，配置代理。以 Firefox 为例子。

在 Firefox 地址栏直接输入 `about:preferences#advanced` 打开高级设置页面。

<center>
<img src="linux-shadowsocks-05.png" width="95%"/>

图 5. Firefox 高级设置
</center>

找到 “Advanced” -> “Network” -> “Settings...”，打开代理配置面板。

选择 “Manual proxy configuration”，清空 “HTTP Proxy”、“SSL Proxy”、“FTP Proxy”，
并设置 “SOCKS HOST” 地址为 `127.0.0.1`，端口为 `1080`（本地端口），类型为 “SOCKS v5”。

<center>
<img src="linux-shadowsocks-06.png" width="95%"/>

图 6. 设置代理
</center>


拖到下面，勾选 “Proxy DNS when using SOCKS v5”，让 DNS 服务也走代理。

<center>
<img src="linux-shadowsocks-07.png" width="95%"/>

图 7. 代理 DNS
</center>

点击 “OK” 保存，完成配置。

# 验证是否成功

打开新的窗口里，开始科学上网。

试试被墙网站：[Google][google]，[Twitter][twitter]，[YouTube][youtube]。

<center>
<img src="linux-shadowsocks-08.png" width="95%"/>

图 8. 打开 Google 试试
</center>

如果连接不成功，检查帐号配置、代理配置，并留意控制台输出信息。

# 为 Chrome / Chromium 设置代理
见 《[为 Chrome / Chromium 设置代理][chrome-proxy]》。

# 简化启动命令（拓展部分）
如果不想每次都要进入下载目录，然后敲老长老长的一个命令，才启动 Shadowsocks。而是想能
在任何一个控制台执行 `ss`，就能启动，那么继续阅读。

## 重命名与移动
重命名为 `sslocal` 并移动到某个 `$PATH` 下。
```sh
$ sudo mv shadowsocks-local-linux32-1.1.5 /usr/local/bin/sslocal
```

## 创建配置文件
创建目录 `/etc/shadowsocks` ，在里面新建文件 `ok.json`，并粘入配置。
```sh
$ sudo mkdir /etc/shadowsocks
$ sudo vim /etc/shadowsocks/ok.json
```

粘贴如下配置。

```json
{
    "server": "112.113.114.115",
    "server_port": 8388,
    "password": "abc123",
    "method": "aes-256-cfb",
    "local_address": "0.0.0.0",
    "local_port": 1080,
    "timeout": 600
}
```
上面命令中，`112.113.114.115` 为服务器地址，`8388` 为服务器端口，`abc123` 为密码，
`1080` 为本地端口，`timeout` 为连接超时。加密方式大小写不分。

## 创建脚本
创建可执行文件 `/usr/local/bin/ss`，用于启动 `sslocal`。

```sh
$ sudo vim /usr/local/bin/ss
```

粘贴如下内容。

```sh
#!/bin/sh
sslocal -c /etc/shadowsocks/ok.json
```

不要忘了添加可执行权限。

```sh
$ sudo chmod +x /usr/local/bin/ss
```

这样，想要启动 Shadowsocks 只需要在任意窗口执行 `ss` 便好了。

<center>
<img src="linux-shadowsocks-09.png" width="95%"/>

图 9. 简化后的命令
</center>

以后如果更换了服务器，只需要修改文件 `/etc/shadowsocks/ok.json` 即可。

# 为命令行程序设置代理（拓展部分）

上面配置后，代理对浏览器生效。但一些命令行程序还需要单独设置。

## 给 git 设置代理
修改 `~/.gitconfig` 文件，在最后添加下面内容。
```
[https]
	proxy = socks5://127.0.0.1:1080
[http]
	proxy = socks5://127.0.0.1:1080
```

保存后，所有 `git pull` 和 `git push` 都会经过代理。

## 给 go 设置代理
在使用 `go get` 去下 `gopkg.in` 、`golang.org` 或者 `code.google.com`
这些依赖时，有时等很久，根本不会成功。出现 `i/o timeout` 错误。

这时在启动了 ss 情况下，设置两个变量就好了。

```sh
$ export http_proxy=sock5://127.0.0.1:1080
$ export https_proxy=sock5://127.0.0.1:1080
```

这样，再次试试
```
$ go get golang.org/x/crypto/bcrypt
```

> 导入的变量作用域只在当前控制台窗口。别的窗口需要再次设置。如要永久设置，需要添加到
环境变量里去。

## 通用配置（ProxyChains）

`curl` 和 `wget` 也有相关的 proxy 参数设置代理，但如果每次都加上多余的参数就比较
累了。还有一些命令行程序，如 `ping`、`docker`，似乎就没有支持代理的参数或配置文件。

所以下面用一种通用的方式，来实现统一代理，需要安装 ProxyChains 。实现的效果是，在
命令行程序及其参数之前，加上 `proxychains4` 就能走代理。

### 安装 ProxyChains

Archlinux 执行：
```sh
$ sudo pacman -S community/proxychains-ng
```

Ubuntu / Debian 执行：
```sh
$ sudo apt-get install proxychains
```

CentOS / RedHat / Fedora 需要从源码构建：
```sh
$ yum install git gcc make -y
$ git clone https://github.com/rofl0r/proxychains-ng.git --depth=1
$ cd proxychains-ng
$ ./configure
$ make && make install && make install-config
```

### 修改配置
修改配置文件 `/etc/proxychains.conf`，在最后添加：
```
socks5  127.0.0.1 1080
```

> 通过源码构建安装的，配置文件路径为 `/usr/local/etc/proxychains.conf`。

### 使用 proxychains
先设置一下 alias。
```sh
$ alias p4='proxychains4'
```

在需要的命令及其参数之前，加上 p4
```sh
$ p4 <commands> <args>
```

如：

```sh
$ proxychains4 curl https://www.google.com.hk
```

<center>
<img src="linux-shadowsocks-10.png" width="95%"/>

图 10. 使用 ProxyChain 给 curl 代理
</center>

> ProxyChains 适用于大多数命令行程序，所以也可以试试在 `git` 和 `go` 加上 `p4`。

# Tips

1. 注意加密方式默认为 AES-256-CFB；

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

附：《[中华人民共和国网络安全法][law]》

# 修改历史
* 2017.06.16 调节空格与缩进。
* 2017.06.01 适配图片到移动设备。

[google]: https://google.com
[twitter]: https://twitter.com
[youtube]: https://youtube.com
[law]: http://www.miit.gov.cn/n1146295/n1146557/n1146614/c5345009/content.html
[linux-download]: https://github.com/fanach/download/releases/download/latest/shadowsocks-local-linux32-1.1.5.gz
[ss-src]: https://github.com/shadowsocks/shadowsocks-go
[chrome-proxy]: http://fanach.github.io/post/chrome-proxy/
