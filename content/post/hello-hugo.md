---
title: "Hello Hugo!"
description: "Saying 'Hello' from Hugo"
date: "2014-09-01"
categories:
  - "example"
  - "hello"
tags:
  - "example"
  - "hugo"
  - "blog"
---

Hello from Hugo! If you're reading this in your browser, good job! The file `content/post/hello-hugo.md` has been
converted into a complete HTML document by Hugo. Isn't that pretty nifty?

A Section
---------

Here's a simple titled section where you can place whatever information you want.

You can use inline HTML if you want, but really there's not much that Markdown can't do.

Showing off with Markdown
-------------------------

A full cheat sheet can be found [here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
or through [Google](https://google.com/).

There are some *easy* examples for styling, though. I can't **emphasize** that enough.
Creating [links](https://google.com/) or `inline code` blocks are very straightforward.

```
There are some *easy* examples for styling, though. I can't **emphasize** that enough.
Creating [links](https://google.com/) or `inline code` blocks are very straightforward.
```

Front Matter for Fun
--------------------

This is the meta data for this post. It is located at the top of the `content/post/hello-hugo.md` markdown file.

```
---
title: "Hello Hugo!"
description: "Saying 'Hello' from Hugo"
date: "2014-09-01"
categories:
  - "example"
  - "hello"
tags:
  - "example"
  - "hugo"
  - "blog"
---
```

This section, called 'Front Matter', is what tells Hugo about the content in this file: the `title` of the item, the
`description`, and the `date` it was posted. In our example, we've added two custom bits of data too. The `categories` and
`tags` sections are used in this example for indexing/grouping content. You will learn more about what that means by
examining the code in this example and through reading the Hugo [documentation](http://gohugo.io/overview/introduction).

# Way to add an image

Suppose you are editing file `content/post/my-lovely-cat.md`, and you want to add a cat photo named `cat.png` in the article.

1. Simply copy `cat.png` under `content/post/my-lovely-cat/cat.png`;
2. Add `![MyCat](cat.png)` in `my-lovely-cat.md` where you want to put photo.

To limit image width or use advanced image operation, use embeded HTML.

example 1: fixed width(stretched)

```
<img src="earth.png" width=720 />
```

<img src="earth.png" width=720 />

example 2: fixed width and height

```
<img src="background.jpg" width=720 height=720 />
```

<img src="background.jpg" width=720 height=720 />

example 3: fixed width

```
<img src="background.jpg" style="width:720px;" />
```

<img src="background.jpg" style="width:720px;" />

example 4: percentage

```
<img src="background.jpg" style="width:30%;" />
```

<img src="background.jpg" style="width:30%;" />

example 5: center with text

```
<center>
<img src="background.jpg" width=720 />

Figure 1. Clock
</center>
```

<center>
<img src="background.jpg" width=720 />

Figure 1. Clock
</center>
