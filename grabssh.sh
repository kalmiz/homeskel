#!/bin/bash
# This script grabs the ssh-agent variables from your current
# session when you login and writes them to fixssh as a 
# persistent store - intended to be refreshed each time you login
SSHVARS="SSH_CLIENT SSH_TTY SSH_AUTH_SOCK SSH_CONNECTION"

for x in ${SSHVARS} ; do
    (eval echo $x=\$$x) | sed  's/=/="/
                                s/$/"/
                                s/^/export /'
done 1>$HOME/bin/fixssh
chmod 700 $HOME/bin/fixssh
