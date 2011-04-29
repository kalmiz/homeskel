#!/bin/bash
#
# Helper for tmux.
#

set_ssh_env()
{
    tmux set-environment -g SSH_AUTH_SOCK $SSH_AUTH_SOCK
    tmux set-environment -g SSH_CLIENT "$SSH_CLIENT"
    tmux set-environment -g SSH_CONNECTION "$SSH_CONNECTION"
}

NAME=$1

if [[ $NAME != "" ]]; then
    
    EXISTS=`tmux ls 2>/dev/null | cut -d: -f1 | grep $NAME`

    if [ "x$EXISTS" = "x" ]; then
        tmux new-session -d -s $NAME
    fi
    #set_ssh_env
    tmux attach-session -t $NAME
else
    sessions=$(tmux ls 2>/dev/null)
    num=$(tmux ls 2>/dev/null | wc -l)
    if [ $num -eq 1 ]; then
        #set_ssh_env
        tmux attach-session -t $(echo $sessions | cut -d: -f1)
    else
        echo "Usage: tx session-name"
        echo ""
        echo "Available sessions:"
        tmux ls 2>/dev/null
    fi
fi
