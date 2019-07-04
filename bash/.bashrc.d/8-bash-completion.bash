if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

export BASH_COMPLETION_USER_DIR=~/.bash_completion.d/
