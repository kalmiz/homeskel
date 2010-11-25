#!/bin/bash

if [ ! -d $HOME/tmp/vim ]; then
    mkdir -p $HOME/tmp/vim
fi


ln -s $HOME/homeskel/bash_profile $HOME/.bash_profile
ln -s $HOME/homeskel/bash_aliases $HOME/.bash_aliases
ln -s $HOME/homeskel/screenrc $HOME/.screenrc
ln -s $HOME/homeskel/vimrc $HOME/.vimrc
ln -s $HOME/homeskel/vim $HOME/.vim
