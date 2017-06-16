+++
title = "我是如何用 Hugo、Travis CI 和 GitHub Pages 搭建博客的?"
date = "2017-05-17T16:10:32+08:00"
description = "我用 Vim 写 Markdown，Hugo 生成静态内容，Chrome 预览，用 Git 进行版本控制并存储博问和配置到 GitHub，用 Travis CI 构建并发布博文到 GitHub Pages。"

draft = true
+++


<center>
<img src="hugo-ci-page.png" width="70%"/>
</center>

# 啰嗦一会
微博微信等软件用久了，对碎片化资讯便开始厌烦，仍想回到节奏稍慢的时代。

一直以来想自己动手搭博客写点东西。但由于各种事（jie）情（kou），一直没有搭好。万事开头难，
尝试过不少姿势搭建博客，好用的确实有很多，但顺心的直到最近才找到。

在一切都是刚刚开始之前，我对博客平台有下面一些期望：

* 美观；
* 轻量，快速，简单；
* 不需要租 VPS，免去配置和维护（其实是寒碜）；
* 能将内容和配置存储，换一个地儿后能快速还原；
* 容易 DIY 和 Hacking；
* 支持 Markdown（格式易于控制和统一，显示代码也好看）；
* 用 GitHub 托管和版本控制；
* 能支持评论和分享就更好了。

到这里就想到了 [GitHub Pages][gh-pages]，但 GitHub 官方主推 Jekyll。照着教程，在自己
机器上试了试，安装过程就很蓝瘦。终于装好后，生成网站时又出现了问题。Google 扒了好一阵，
在 Jekyll GitHub Issue 中遇到了同样的问题，但按照上面给的方案，并没有解决我的问题。
罢了，折腾之心已死，消停了几个月。

开发时，用 [Golang][go] 比较多，也知道 [Hugo][hugo] 的存在，但当时并不知道
Hugo 能够无缝支持 GitHub Pages。直到有一天还是发现了，惊喜，立刻安装试用起来。经过一
段时间摸索，一个能看的博客出锅了，就是你现在看到的样子。

如果你像我一样，也想按着这样的方式写博文：

1. 用简单的文本编辑器（如 Vim、Atom）编写 Markdown 格式的文章；
2. 用 Hugo 快速生成静态内容，打开 Chrome 实时预览改动；
3. 用 Git 进行版本控制，并将博客配置、文章、主题、图片等文件提交到 GitHub；
4. 在 push 到 GitHub 后，Travis CI 默默生成网站，并发布到 GitHub Pages。

那么，继续阅读，这篇教程正适合你。

> 熟悉 Hugo 与 GitHub Pages 的读者，可直接访问 [本博客源文件][blog-src] 查看配置、主题吧。

# 需要哪些东西？
那么先列一下炖这锅博客需要的原材料和烹饪技术：

* GitHub 帐号 × 1；
* Travis CI 帐号 × 1；
* 计算机（Linux、MacOS 或 Windows） × 1；
* 熟悉 Markdown 语法；
* 熟悉控制台的使用；
* 有一定前端基础（HTML / CSS ）就完美了。


# 开始

笔者在一台 CentOS 7 x64 的机器上写博文。因此这里只说 Linux 环境下的步骤，Windows 与
MacOS 用户可类推过程。

# 下载 Hugo
从 [Hugo 官网][hugo] 或 [GitHub Release 页面][get-hugo] 获取 Hugo。

Linux 用户打开控制台，直接执行:
```sh
# 将 0.21 替换为目标版本
$ curl -sSL -o ./hugo.tar.gz \
  https://github.com/spf13/hugo/releases/download/v0.21/hugo_0.21_Linux-64bit.tar.gz

$ sudo tar -xzf ./hugo.tar.gz -C /usr/local/bin/

$ rm ./hugo.tar.gz
```

确保 Hugo 已正确安装。
```sh
$ hugo version
Hugo Static Site Generator v0.21 linux/amd64 BuildDate: 2017-05-22T21:12:19+08:00
```

# 生成一个样例站点

## 创建一个目录
用于存放博客配置、文章、主题、图片等。

```sh
$ mkdir blog
$ cd blog
```

> 后面未经特别说明，执行路径均为 blog 下。

## 生成模板
```sh
$ hugo new site .
Congratulations! Your new Hugo site is created in /tmp/blog.
...
```

将会生成下面文件和目录

```sh
$ tree
.
├── archetypes
├── config.toml
├── content
├── data
├── layouts
├── static
└── themes

6 directories, 1 file
```

其中，`config.toml` 为配置文件，在里面可以定义博客网站地址、构建配置、标题、导航栏
等等，后面都会提到。

> 除了 `toml` 语法，还支持 `yaml` 和 `json` 格式配置。如果想现在了解配置文件的使用，
见 [Configuring Hugo][hugo-conf]。

## 选择一个主题
访问 [Hugo Themes][hugo-theme] 查找你喜欢的主题，并下载到 `themes` 目录下。

比如想使用 [Lithium 主题][theme-lith]，则按照安装说明，clone 下来。
```sh
$ git clone https://github.com/jrutheiser/hugo-lithium-theme --depth=1 themes
```

修改 `config.toml` 文件，添加下面一行
```toml
theme = "hugo-lithium-theme"
```

> 这个主题干净简介，但对代码、引用显示效果不好，后面我得改改 Markdown Render。

## 预览内容
执行下面命令，使用 Hugo 生成静态内容并在本地启动 HTTP Server。
```sh
hugo server
```

打开浏览器，访问 `http://localhost:1313/` 预览生成的内容。

你应该能够看到这样的页面。

<center>
<img src="blog-tutorial-01.png" width="95%"/>

图 1. 首次生成的页面
</center>

好了，尽管没有什么文章，但可以看到下面 “RSS feed” 字样了，说明的确是生成了
一个空的框架出来。

# 添加一篇文章

下面，开始写你的第一篇文章吧。

## 新建文章
`content` 目录用于分类存储博文的 Markdown 文件，也可存放图片文件（资源文件）。

在 `content` 内创建 `post` 目录，用于放博文，然后在里面创建 Markdown 文件。
```sh
$ mkdir content/post
$ touch content/post/first-article.md
```

也可以使用 Hugo 的命令，新建一篇文章。
```sh
hugo new post/first-article.md
```

Hugo 的 Markdown 文件顶部，用一对 “`+++`” 标识特殊字段，包含文章标题、日期、作者等信息。
有的主题还支持 `tag` 和 `category` 这样的字段，用于分类和检索博文。

```md
+++
date = "2017-05-28T20:06:42+08:00"
title = "first article"

+++
```

下面就是用自己喜欢的文本编辑器，编写这个 Markdown 文件。

如果还不熟悉 Markdown 语法，可以参考这篇 [《Markdown——入门指南》][md-guide]。

写好后，在新的控制台里执行 `hugo server` 生成页面并预览。

<center>
<img src="blog-tutorial-02.png" width="95%"/>

图 2. 新建的文章
</center>

<center>
<img src="blog-tutorial-03.png" width="95%"/>

图 3. 新建的文章内容
</center>


Hugo Server 可以在你一边写 Markdown 时，一边监视文件改动，在文件保存后，自动重新生成
静态内容，并自动刷新浏览器页面。

## 添加图片
假如你当前编辑的文章 Markdown 文件为 `content/post/my-lovely-cat.md`，而且你有一张
`cat.jpg` 的文件要添加到文章中。一种方法是，按照下面的步骤：

1. 创建目录 `content/post/my-lovely-cat/` ；
2. 拷贝 `cat.jpg` 到上面目录里；
3. 在 `first-article.md` 文件适当位置，添加 `![MyCat](cat.jpg)` 。

这样，就可以添加图片了。

图片示例 1. 引入原图

```sh
![MyCat](cat.jpg)
```
![MyCat](cat.jpg)

图片示例 2. 相对屏幕宽度比例
```sh
<img src="cat.jpg" width="90%"/>
```
<img src="cat.jpg" width="90%"/>

图片示例 2. 固定宽度（高度按比例缩放）

如果想限制图像的宽度、高度，或者设置对齐方式。那么可以嵌入 HTML 。
```sh
<img src="cat.jpg" width="400"/>
```
<img src="cat.jpg" width="400"/>

图片示例 3. 居中对齐，并添加文本

```sh
<center>
<img src="cat.jpg" width="95%"/>

图 xx. 暗中窥视
</center>
```

<center>
<img src="cat.jpg" width="95%"/>

图 xx. 暗中窥视
</center>

> 使用 Hugo 的 [Shortcodes][hugo-short] 也可以引入图片。

## 添加下载链接
如果想在文章中，提供一些文件供下载，可以插入链接。

如果文件在别的地方可以长期下载，比如 Hugo 的安装包，那最好定义一个重定向链接。如：

```
[hugo_0.21_Linux-64bit.deb](https://github.com/spf13/hugo/releases/download/v0.21/hugo_0.21_Linux-64bit.deb)
```

如果别的地方下载不到，想自己上传。一种方式是像引用图片一样，把文件放在对应目录下，
适用于 1MB 内小文件。（如果文件较大，但这样的方式并不推荐，因为这会让 Repo 变大变慢。）

一种较好的方式是将文件上传到 Release 中。然后引用 Release 中的下载链接。


# 进一步配置
## 配置 baseURL
文件 `config.toml` 中，设置如下：

```toml
baseurl = "https://fanach.github.io/"
title = "Fanach Blog"
```

## 添加导航栏分类

导航栏中可以添加链接对内容进行分类。

<center>
<img src="blog-tutorial-04.png" width="95%"/>

图 4. 导航栏
</center>

编辑文件 `config.toml`。比如想要添加一个 “Articles”，一个“About” 页面，则添加如下内容。

```toml
[[menu.main]]
    name = "Articles"
    url = "/"
    weight = 1
[[menu.main]]
    name = "About"
    url = "/about/"
    weight = 2
```
其中，`weight` 为从左向右的显示顺序。

<center>
<img src="blog-tutorial-05.png" width="95%"/>

图 5. 导航栏新增链接
</center>

此时，点击 “About” 后，出现 `404 page not found`，原因是未创建相应的文件。

下面在 `content` 目录下，新建文件 `about.md`，并使用写上一些介绍文字。

<center>
<img src="blog-tutorial-06.png" width="95%"/>

图 6. About 页面
</center>

## 设置左上角 Logo

左上角无法显示的图片为 Logo，需要准备一张约 64×64 的图标文件（ico、png、jpg 格式都可以）。

<center>
<img src="blog-tutorial-07.ico" width="64"/>

图 7. 小拳头
</center>

拷贝文件到 `static/images/` 目录下。

编辑文件 `config.toml`，在 `[params]` 段下设置如下内容 。

```sh
[params]
    [params.logo]
    url = "logo.ico"
    width = 50
    height = 50
    alt = "Logo"
```

这样，再查看时候，应该有了 Logo 图标。

<center>
<img src="blog-tutorial-08.png" width="95%"/>

图 8. 导航栏设置 Logo
</center>

> 并不是所有主题都是这样设置的。需要了解所用的主题 template 文件里是怎样写的。
如 Lithium 主题中，文件 themes/hugo-lithium-theme/layouts/partials/nav.html 写了
```
<img src="{{ .Site.BaseURL}}images/{{.Site.Params.logo.url}}"
```

所以得知 用的 Logo 文件路径与配置文件里的层次关系。

## 启用 Disqus 开启评论
还没写。

### 启用 emoji 表情支持
还没写。

### 设置 Favicon
还没写。

### 设置底部信息
还没写。

### 插入 Tweet
还没写。

### 假装是个数学男
还没写。

### 替换 Markdown Render
还没写。

## 提交到 GitHub
在 GitHub 创建一个新的 Repo，名称如 `blog`，用于存储这个博客配置、文章、静态资源等。

本地初始化 git 。

```sh
$ git init
$ git commit --allow-empty
```

在本地创建 commit 时，至少将下面的文件或目录 add 进去。

```
$ git add config.toml
$ git add content/
$ git add static/
```

由于 `themes/hugo-lithium-theme` 目录本身也是一个 git repo，所以可以使用 git submodule 来添加。

```
$ git submodule add \
https://github.com/jrutheiser/hugo-lithium-theme themes/hugo-lithium-theme
```

> 在一个新的地方 clone 下 blog 项目后，要同步 git modules，执行
```sh
git submodule sync && git submodule update --init --recursive
```

执行 `hugo` 不加任何参数，会生成静态内容到 `public/` 下。这个目录无需添加，因为内容都是可以
再次生成的。为了防止被 add 到 commit 中，可以将 `public/` 加入 `.gitignore` 中。
```sh
$ echo "public/" >> .gitignore
$ git add .gitignore
```

接着提交到你的 GitHub 中。
```sh
$ git commit -am "add files"
$ git remote add origin https://github.com/<yourname>/blog
$ git push origin master
```

> 将 <yourname> 替换为你的 GitHub 用户名，下文同。

到这里，只是把博客配置、文章还有静态资源给上传到了 GitHub，还不能访问 GitHub Pages。

# 发布到 GitHub Pages

## 一些基础知识

GitHub Pages 是 GitHub 推出的一个类似于 WordPress、Medium 的静态内容托管平台。适合一些
开源项目的文档。当然托管博文也不赖。

GitHub Pages 需要一堆生成好的 HTML、CSS 与资源文件才能工作，生成工具不限于 Hugo 或者
Jekyll 等。

GitHub Pages 静态内容放在 GitHub 的 Repo 中。

在 GitHub Pages 中，一个用户（或者组织）拥有一个 `<yourname>.github.io` 这样的域名，
访问这个域名，就能访问到某个 Repo 中的静态内容。

在 GitHub 中，`<yourname>.github.io` 这样的 Repo 具有特殊含义。GitHub 能自动识别，
并认为这是存放 `<yourname>.github.io` 这个域名静态内容的 Repo。GitHub 会自动启用
 GitHub Pages。

> 当然，如果 Repo 名字和域名不一样，也是可以的。但需要一些额外的配置。
见 [Configuring a publishing source for GitHub Pages][pages-guide]。

> 如果将生成的静态内容，放到 `blog` 的 `gh-pages` 也是可以的。但这里为了分离，还是
将静态内容单独存放。

一些 HTML、CSS 与资源文件引用的路径需要是绝对路径，也就是说，引用路径需要带上域名。

在 Hugo 中，有个参数叫 baseURL，设置后，可以在生成的静态内容引用路径前，带上域名。

## 生成并上传

在 `blog` 的上一级目录，创建一个 `<yourname>.github.io` 的目录。这个目录用于存储
Hugo 生成好的静态内容。
```sh
$ mkdir ../<yourname>.github.io
```

执行下面命令，生成静态内容到 `<yourname>.github.io` 中。
```sh
$ hugo --baseURL=https://<yourname>.github.io/ -d ../<yourname>.github.io
```

接着在 GitHub 创建一个名为 `<yourname>.github.io` 的 Repo，并将上面目录
 `<yourname>.github.io` 中的全部文件提交到这个 Repo 中。
 ```sh
$ cd ../<yourname>.github.io
$ git init
$ git commit --allow-empty
$ git add --all
$ git commit -am "add files"
$ git add origin master https://github.com/<yourname>/<yourname>.github.io
$ git push origin master
 ```

上传完成后，浏览器打开 `<yourname>.github.io` ，应该可以看到博客页面了。

<center>
<img src="blog-tutorial-09.png" width="95%"/>

图 9. GitHub Pages 页面
</center>

至此，一个博客已经出锅了。

> 样例 Blog 已经开源，见 [github.com/zyfdegh/blog-example][blog-example]

## 配置 Travis CI（拓展部分）
[Travis CI][travis] 是一款云端持续集成工具，对个人开放 Repo 免费使用。使用 GitHub
帐号可以启用 Travis CI 并允许 Travis CI 访问你的 GitHub Repo。

<center>
<img src="blog-tutorial-10.png" width="95%"/>

图 10. Travis CI 首页
</center>


如果想在每一次新建、修改文章或替换主题后，只需要 commit 和 push 两条命令提交改动到
`blog` 这个 Repo，而无需重新生成和更新 `<yourname>.github.io` 这个 Repo， 就能让
GitHub Pages 自动更新。那么使用 Travis CI 便能实现。

这里 Travis CI 会在云端自动检测 blog 这个 Repo 的更新，并代替人工生成静态内容、
提交改动的过程（即上面 “发布到 GitHub Pages” 这个过程）。

> 用 “检测” 一词并不准确，其实是在对 blog 的 push 操作后，GitHub 发了通知触发 Travis CI 。

### 生成 GitHub Token

直接访问 [https://github.com/settings/tokens/new][gh-key]，或打开 GitHub ->
Settings -> Personal access tokens -> Generate new token，输入密码。

填入 Token 名称，并只勾选 `public_repo` 这一项目。

<center>
<img src="blog-tutorial-11.png" width="95%"/>

图 11. 生成 Token
</center>

点底部 Generate token，复制这个 Token，下面将用到。

### 添加 Repo
点击这里的加号。

<center>
<img src="blog-tutorial-12.png" width="95%"/>

图 12. 添加 Repo
</center>

点击滑条启用 Repo。

<center>
<img src="blog-tutorial-13.png" width="95%"/>

图 13. 启用 Repo
</center>

> 这里截图用的是 zyfdegh/blog 作为示例，而不是 fanach/blog，因为后者已经配置过。

### 设置 Job
点击齿轮图标，进入设置页面。勾选 “Build only if .travis.yml is present”。

在 “Environment Variables” 中，创建环境变量，键为 “GITHUB_API_KEY”，值为上面复制的 Token。

<center>
<img src="blog-tutorial-14.png" width="95%"/>

图 14. 配置 Job
</center>

确保右侧按钮处于 ** 灰色 OFF** 状态，否则构建日志中，将会输出 Token，并容易泄漏。

最后，点最右侧 “ADD” 按钮。

<center>
<img src="blog-tutorial-15.png" width="95%"/>

图 15. 添加变量
</center>

### 添加 .travis.yml

在 `blog` 这个 Repo 里，创建文件 `.travis.yml`，内容参考下面。
```yml
sudo: false

language: go

git:
  depth: 1

install: go get -v github.com/spf13/hugo

script:
  - hugo

deploy:
  provider: pages
  skip_cleanup: true
  # token is set in travis-ci.org dashboard
  github_token: $GITHUB_API_KEY
  on:
    branch: master
  local_dir: public
  repo: fanach/fanach.github.io
  target_branch: master
  email: deploy@travis-ci.org
  name: deployment-bot
```

这个文件将会告诉 Travis CI 做下面步骤。

1. 启动一个有 go 语言环境的容器；
2. 在容器内用 go get 安装 Hugo；
3. 克隆当前 Repo 并进入目录；
4. 执行 hugo 命令（将生成静态内容到 public/ 下）；
5. 部署内容到 GitHub Pages。对 public/ 目录下所有内容提交到
 github.com/fanach/fanach.github.io 的 master 分支上。使用 Token 访问，并用帐号
 deployment-bot。

添加文件 `.travis.yml` 并 push 到 `blog` 中，接着将会进行一次构建。

<center>
<img src="blog-tutorial-16.png" width="95%"/>

图 16. 构建过程
</center>

如果生成、部署结果没有错，那将会 GitHub Pages 页面将会更新。

> 使用 Travis CI 构建 GitHub Pages 会清空 `<yourname>.github.io` 中所有原有 commits，
并且只保留最新生成的内容。这个要注意，一不小心无法回退了。

## 总结
到这里，配置完成，其实花了很大功夫，但是这样一次配置后，后面写博文的过程就爽歪歪了。
只需要对 blog 进行改动，然后提交。像写程序一样，写博文了。较为 nerd 的一种方式。
折腾至死。

头一次写这么长的教程，如有误，求轻喷并指正。

## FAQ
### 如果我有自己的域名，并想重定向到 GitHub Pages，可以嘛？
** 答：** 似乎不行，我试过 CNAME 重定向，结果 GitHub Pages 是工作了。但自己的域名显示不了。
可以试一试，改掉 baseURL 为自己的域名，然后重新生成、提交一次。但这样就
牺牲 GitHub Pages 了。

# 参考文档
[Continuous Deployment: Hugo + Travis CI → GitHub Pages][ref-1]

<div style="text-align: right"> 2017.05 博子腾 于公寓 </div>

[gh-pages]: https://pages.github.com/
[go]: https://golang.org/
[hugo]: https://gohugo.io
[get-hugo]: https://github.com/spf13/hugo/releases
[blog-src]: https://github.com/fanach/blog
[hugo-conf]: http://gohugo.io/overview/configuration/
[hugo-theme]: http://themes.gohugo.io/
[theme-lith]: http://themes.gohugo.io/hugo-lithium-theme/
[md-guide]: http://www.jianshu.com/p/1e402922ee32/
[hugo-short]: http://gohugo.io/extras/shortcodes/
[travis]: https://travis-ci.org/
[pages-guide]: https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/
[blog-example]: https://github.com/zyfdegh/blog-example
[ref-1]: https://www.metachris.com/2017/04/continuous-deployment-hugo---travis-ci--github-pages/
[gh-key]: https://github.com/settings/tokens/new
