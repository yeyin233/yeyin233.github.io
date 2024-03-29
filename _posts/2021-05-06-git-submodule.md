---
layout: post
title: Git中submodule子模块的添加、使用和删除
author: Liu Shi
tags:
    - 编程
---

**声明：本文转载自https://blog.csdn.net/guotianqing/article/details/82391665，仅用于学习，侵权则删**

### 背景
项目中经常使用别人维护的模块，在git中使用子模块的功能能够大大提高开发效率。

使用子模块后，不必负责子模块的维护，只需要在必要的时候同步更新子模块即可。

本文主要讲解子模块相关的基础命令，详细使用请参考man page。

### 子模块的添加
添加子模块非常简单，命令如下：
```bash
git submodule add <url> <path>
```
其中，url为子模块的路径，path为该子模块存储的目录路径。

执行成功后，`git status`会看到项目中修改了`.gitmodules`，并增加了一个新文件（为刚刚添加的路径）

`git diff --cached`查看修改内容可以看到增加了子模块，并且新文件下为子模块的提交hash摘要

`git commit`提交即完成子模块的添加

### 子模块的使用
克隆项目后，默认子模块目录下无任何内容。需要在项目根目录执行如下命令完成子模块的下载：
```bash
git submodule init
git submodule update
```
或：
```bash
git submodule update --init --recursive
```
执行后，子模块目录下就有了源码，再执行相应的`makefile`即可。

### 子模块的更新
子模块的维护者提交了更新后，使用子模块的项目必须手动更新才能包含最新的提交。

在项目中，进入到子模块目录下，执行 `git pull`更新，查看`git log`查看相应提交。

完成后返回到项目目录，可以看到子模块有待提交的更新，使用`git add`，提交即可。

### 删除子模块
有时子模块的项目维护地址发生了变化，或者需要替换子模块，就需要删除原有的子模块。

删除子模块较复杂，步骤如下：

1. `rm -rf `子模块目录 删除子模块目录及源码
2. `vi .gitmodules` 删除项目目录下`.gitmodules`文件中子模块相关条目
3. `vi .git/config` 删除配置项中子模块相关条目
4. `rm .git/module/* `删除模块下的子模块目录，每个子模块对应一个目录，注意只删除对应的子模块目录即可

---

执行完成后，再执行添加子模块命令即可，如果仍然报错，执行如下：
```bash
git rm --cached 子模块名称
```
完成删除后，提交到仓库即可。
