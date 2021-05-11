---
layout: post
title: 搭建GitLab服务器
author: Liu Shi
tags:
    - Linux
    - Git
    - GitLab
---

# 环境

- Ubuntu 18.04.5 LTS

# 搭建步骤

1. 安装依赖

```bash
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates
```

2. 添加GitLab存储库

```
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce
```

# 配置

1. 修改访问地址

```bash
$ sudo vim /etc/gitlab/gitlab.rb

// 将external_url  地址改成本地
// external_url 'http://localhost'
```

2. 保存并重新配置

```
sudo gitlab-ctl reconfigure
```

3. 启动或者停止

```bash
sudo gitlab-ctl start
sudo gitlab-ctl stop
```

# 相关资料

- https://www.jianshu.com/p/991daadbfc4d