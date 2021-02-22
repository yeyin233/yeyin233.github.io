这个repo是个人[博客](https://yaotingting.net/)站点文件和原始资料文件的存放仓库。

### 分支

- main:为站点公布展示文件，有[Hexo](https://hexo.io/zh-cn/index.html)解析生成，在部署时上传至Github站点；
- source: 为本地原始文件，即md文件，配置文件.yml等等，可下载这个分支的文件在`blog/source/_posts`下添加md文件发布博客；

### 如何添加并发布个人博客资料

1. 下载分支source的代码到本地电脑

```bash
git clone -b source git@github.com:xuanwuwake/xuanwuwake.github.io.git
```

2. 在路径`blog/source/_posts`下添加md文件
3. 本地生成站点资料，并在本地服务器查看网站显示

```bash
hexo generate # 生成站点资料，或者执行 hexo g也可
hexo server # 启动本地服务器，查看网站显示，或者执行hexo s也可
```

4. 部署网站展示资料至Github

```bash
hexo deploy # 或者执行hexo d也可
```

5. 点击域名https://yaotingting.net/查看显示。