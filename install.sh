#!/bin/sh

if [ -e vim ]
then
    echo
    echo vimfiles has been installed!
    echo if you want to reinstall, please remove the [vim] directory!!!
    echo
    exit 1
fi

# Backup old vimfiles
BACKUP_DIR=~/vimfiles_bak
if [ ! -e "$BACKUP_DIR" ]
then
	mkdir $BACKUP_DIR
	if [ -e ~/.vimrc ]; then mv ~/.vimrc $BACKUP_DIR; fi;
	if [ -e ~/.vim ]; then mv ~/.vim $BACKUP_DIR; fi;
	if [ -e ~/.viminfo ]; then mv ~/.viminfo $BACKUP_DIR; fi;
else
    rm ~/.vimrc
    rm ~/.vim
fi

# Get vundle
git clone https://github.com/VundleVim/Vundle.vim.git vim/bundle/Vundle.vim

# Use vimfiles in current directory
ln -sf `pwd`/vimrc ~/.vimrc
ln -sf `pwd`/vim ~/.vim

# Install plugins
vim +PluginInstall +qall


