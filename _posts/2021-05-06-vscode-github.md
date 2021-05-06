---
layout: post
title: 多用户办公免密vscode+github
author: Liu Shi
tags:
    - 编程
---

# 场景
1. 开发中我们经常使用vscode跨平台开发
2. 将代码push到github上
3. 我们在一个服务器上多人使用git，在使用ssh commit时会导致账户冲突

场景1和2我们在普通模式下会需要频繁输入密码，此问题可以用ssh解决。场景3可以在服务器上创建多个账户解决。

# 解决方案
解决问题1：
在[博客](https://www.cnblogs.com/wolbo/p/11979134.html)中给出了方案：
在**本地客户机**用`ssh-keygen`生成公钥，公钥默认存放在`~/.ssh/id_rsa.pub`，将公钥复制到**远程服务器** `~/.ssh/authorized_keys`
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
# 复制~/.ssh/id_ed25519.pub
cat ~/.ssh/id_ed25519.pub
# 粘贴到远程机器~/.ssh/authorized_keys，若没有，则创建
```

解决问题2：
在[github文档](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)中给出解决方案：
1. 生成公钥
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
2. 将公钥复制到[SSH keys](https://github.com/settings/keys).

解决问题3：
```bash
adduser user_name
```

在添加新用户至Ubuntu时，若使用`sudo`会报错，解决方法如下：

```bash
#使用能运行sudo命令的账户
sudo chmod u+w /etc/sudoers
sudo vim /etc/sudoers

# 将新账户按照root格式添加一行
root    ALL=(ALL:ALL) ALL
$new_username ALL=(ALL:ALL) ALL
```

[查看PC上有多少组/用户](https://blog.csdn.net/dehailiu/article/details/10086725)：

```bash
$ cat /etc/group # 查看所有组
$ sudo cat /etc/shadow # 查看所有用户
```
