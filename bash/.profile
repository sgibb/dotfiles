# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# @sgibb because it is read by both interactive and non-interactive shells we
# add all common environment variables etc. into .profile.d
if [ -d "${HOME}/.profile.d" ]; then
    for FILE in $(ls ${HOME}/.profile.d/*.sh); do
        source "${FILE}"
    done
fi
