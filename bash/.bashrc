# ~/.bashrc is normally executed by bash only for non-login scripts such as ssh,
# cron, etc. Thus any non-interactive functions in ~/.bashrc shoud be as
# lightweight (minimal) as possible to reduce the overhead when starting
# a non-login shell.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f "${HOME}/.profile" ]; then
    source "${HOME}/.profile";
fi

if [ -d "${HOME}/.bashrc.d" ]; then
    for FILE in $(ls ${HOME}/.bashrc.d/*.bash); do
        source "${FILE}"
    done
fi
