if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

if [ -d ~/.bash_completion.d ]; then
    for f in ~/.bash_completion.d/*; do
        [ -f "${f}" ] && source "${f}"
    done
fi
