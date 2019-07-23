if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

for f in ~/.bash_completion.d/*; do
  [ -f "${f}" ] && source "${f}"
done
