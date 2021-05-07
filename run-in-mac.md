# 1. 安装相关工具

## 1.1 ruby
用`which ruby`查看macOS上是否存在`ruby`，若版本较低，则升级`ruby`：


```
brew install ruby
git -C /usr/local/Library/Taps/homebrew/homebrew-core fetch --unshallow
brew install --build-from-source ruby
```

## 1.2 bundle
用`which bundle`查看macOs上是否存在`bundle`，若不存在，则安装：

```
sudo gem install bundler
```
