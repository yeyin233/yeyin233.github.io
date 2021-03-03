---
title: Linux vim
---

# vi/vim按键

## 光标移动方法

|按键|说明|
|-|-|
|Home|移动当前行第一个字符|
|End|移动到当前行最后一个字符|
|G|移动到档案最后一行|
|nG|移动到档案第n行，n用`set nu`设置|
|gg|移动到档案第1行，相当于1G|
|n`<Enter>`|n为数字，光标向下移动n行|

## 搜索替换
|按键|说明|
|-|-|
|/word|在光标之下搜索名为word字符串|
|?word|在光标之上搜索名为word字符串|
|n|n英文按键，重复前一个搜索动作|
|N|反向重复搜索|
|:n1,n2s/word1/word2/g|n1和n2是数字，在n1和n2之间搜索word1字符串，并将其替换成word2|

## 删除复制粘贴

|按键|说明|
|-|-|
|dd|删除游标所在行|
|ndd|删除游标所在行的向下n行|
|yy|复制游标所在行|
|nyy|n为数字，复制游标所在行向下n行|
|p,P|p,将复制的数据粘贴在光标的下一行，P将复制数据粘贴到上一行|
|u|复原前一个动作，即撤回---> undo|
|[Ctrl]+r|重做上一个动作---> redo|
|.|重复前一个动作|

# 配置vim特性

全局修改vim，可以编辑`/etc/vim/vimrc`

只修改当前用户vim配置，

```bash
vim ~/.vimrc
```

## 配置tab空格

```bash
set ts=4
set expandtab
set autoindent
:set ts=4
:set expandtab
:%retab!
```

## 配置行号
```bash
set nu
```
# 参考资料
[vim命令](https://www.runoob.com/linux/linux-vim.html)
