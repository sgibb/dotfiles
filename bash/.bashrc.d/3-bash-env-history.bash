# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# Max number of commands in HISTFILE
export HISTSIZE=10000

# Max number of lines in HISTFILE
export HISTFILESIZE=10000

# Some commands should not appear in the history
# `&` == previous command
export HISTIGNORE="&:l:ls:la:lt:cd:cd -:pwd:date:* --help"
