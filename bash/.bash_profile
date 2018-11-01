# When `bash` is invoked for an login shell (such as a new Terminal window)
# this ${HOME}/.bash_profile will be the first local file executed by `bash` after
# the system-wide files /etc/profile and /etc/bashrc.

# ${HOME}/.bash_profile is not executed by non-login shells, so don't put anything
# here that other bash scripts may need -- they should be placed in ${HOME}/.bashrc
# instead.

# sources .profile automatically
if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc";
fi

if [ -d "${HOME}/.bash_profile.d" ]; then
    for FILE in $(ls ${HOME}/.bash_profile.d/*.bash); do
        source "${FILE}"
    done
fi
