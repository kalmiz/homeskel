
export PS1="\[\033]0;\w\007\]$PS1"
export PATH="$HOME/bin:$PATH"
export TERM="xterm-256color"
export LANG=en_US.utf8
export EDITOR="vim"
export VISUAL=$EDITOR
export MYSQL_PS1="\u@\h:\d> "

shopt -s expand_aliases

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -d ~/.alias.d ]; then
    . ~/.alias.d/*
fi
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

set -o vi
set editing-mode vi
set keymap vi
set convert-meta on
