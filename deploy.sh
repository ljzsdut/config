#!/bin/bash
prefix_dir=$(cd "$(dirname "$0")"; pwd)   #获取脚本的绝对路径

#vim配置文件
[[ -e ~/.vimrc ]] && mv -f ~/.vimrc{,.bak}
ln -s ${prefix_dir}/vimrc ~/.vimrc

##neovim配置文件
#[[ -d ~/.config/nvim/autoload ]] || mkdir ~/.config/nvim/autoload
#[[ -e ~/.config/nvim/init.vim ]] && mv -f ~/.config/nvim/init.vim{,.bak}
#ln -s ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/plug.vim
#ln -s ${prefix_dir}/vimrc ~/.config/nvim/init.vim

#alacritty配置文件
[[ -e ~/.config/alacritty/alacritty.yml ]] && mv -f ~/.config/alacritty/alacritty.yml{,.bak}
ln -s ${prefix_dir}/alacritty.yml  ~/.config/alacritty/alacritty.yml

#albert
[[ -e ~/.config/albert/albert_run ]] && mv -f ~/.config/albert/albert_run{,.bak}
ln -s ${prefix_dir}/albert_run ~/.config/albert/albert_run

#i3
[[ -e ~/.config/i3 ]] && mv -f ~/.config/i3{,.bak}
ln -s ${prefix_dir}/i3 ~/.config/i3

##compton,需要编译安装:https://github.com/ljzsdut/compton
#[[ -e ~/.config/compton.conf ]] && mv -f ~/.config/compton.conf{,.bak}
#ln -s ${prefix_dir}/compton.conf ~/.config/compton.conf


