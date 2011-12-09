#!/bin/bash

if [ ! -d $HOME/tmp/vim ]; then
    mkdir -p $HOME/tmp/vim
fi


ln -s $HOME/homeskel/bash_profile $HOME/.bash_profile
ln -s $HOME/homeskel/bash_aliases $HOME/.bash_aliases
ln -s $HOME/homeskel/screenrc $HOME/.screenrc
ln -s $HOME/homeskel/tmux.conf $HOME/.tmux.conf
ln -s $HOME/homeskel/vimrc $HOME/.vimrc
ln -s $HOME/homeskel/vim $HOME/.vim
ln -s $HOME/homeskel/.ctags $HOME/.ctags

if [[ `uname` == "Darwin" ]]; then
    ln -s $HOME/homeskel/tmux_osx.conf $HOME/.tmux_osx.conf
fi
