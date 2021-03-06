# Vimrc Configuration File

## 安装指导

### 1. Clone仓库到本地Linux机器

`
cd $HOME
git clone git@10.1.1.99:yulongc/vimfiles.git
`

### 2. 确认Vim以及Ctags已安装

`
which vim
which ctags
`

如果vim或者ctags没有安装，使用一下命令安装：

`
sudo apt-get update
sudo apt-get install vim
sudo apt-get install ctags
`

### 3. 执行vimrc安装脚本

`
cd ~/vimfiles
./install.sh
`

之后会弹出安装窗口，等待安装完成。

> 注：安装界面没有进度条显示。安装过程中会到github等开源网站下下载仓库，可能
会比较慢，请耐心等待。


## 使用指导

### 快捷键

NerdTree: F4 切换打开和关闭

TagList：F9 切换打开和关闭

> 可以修改vimrc文件更改快捷键绑定
其他快捷键请查看vimrc文件，或者google/baidu

## 效果预览

![](./pic/vim.png) 


