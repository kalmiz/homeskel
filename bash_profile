
export PS1="\[\033]0;\w\007\]$PS1"
export PATH="$HOME/bin:$PATH"
export TERM="xterm-256color"
export LANG=en_US.utf8
export EDITOR="/usr/bin/vim"
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

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local      YELLOW="\[\033[1;33m\]"
  local       RESET="\[\e[0m\]" 
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

  #export PS1="\[\033]0;\w\007\]$YELLOW\$(parse_git_branch)$RESET $PS1"
  export PS1="$YELLOW\$(parse_git_branch)$RESET$PS1"
}
proml

set -o vi
set editing-mode vi
set keymap vi
set convert-meta on

# Settings for OSX
if [[ `uname` = "Darwin" ]]; then
	export PATH="$PATH:/opt/local/bin:/opt/local/sbin"
fi

