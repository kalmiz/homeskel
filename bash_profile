
export PATH="$HOME/bin:$PATH"
export TERM="xterm-256color"
export LANG=hu_HU.utf8
export EDITOR="vim"
export VISUAL=$EDITOR
export MYSQL_PS1="\u@\h:\d> "

shopt -s expand_aliases

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

set -o vi
