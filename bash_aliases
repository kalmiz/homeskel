#bash
alias b="cd $OLDPWD"
alias ll="ls -al"
alias tgz="tar -xzf"
alias tbz="tar -xjf"
alias f="source ~/bin/fixssh"

# VIM
alias v="view -T xterm-256color"
alias vi="/usr/bin/vim -T xterm-256color"
alias vim="/usr/bin/vim -T xterm-256color"

# screen
alias sc="screen -U"
alias r="screen -r"
alias l="screen -list"

# subversion
alias st="svn st"
alias sd="svn diff"
alias si="svn ci"
alias sr="svn revert"
alias ss="svn st -u"
alias sp="svn up"

# package management
alias i="sudo apt-get install"
alias s="apt-cache search"

# web
alias k="w3m http://kalmi.eu/"

# scala
alias scalatags="/opt/local/bin/ctags -h ".scala" -R --scala-kinds=cot --exclude=*.js -f tags ."
