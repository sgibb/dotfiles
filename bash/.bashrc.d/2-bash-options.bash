# shopt -s/-u sets/unsets the option

# If set, a command name that is the name of a directory is executed as if it
# were the argument to the cd command. This option is only used by interactive
# shells.
shopt -s autocd

# If set, minor errors in the spelling of a directory component in a cd
# command will be corrected. The errors checked for are transposed characters,
# a missing character, and a character too many. If a correction is found, the
# corrected path is printed, and the command proceeds. This option is only used
# by interactive shells.
shopt -s cdspell

# If this is set, Bash checks that a command found in the hash table exists
# before trying to execute it. If a hashed command no longer exists, a normal
# path search is performed.
shopt -s checkhash

# If set, Bash checks the window size after each command and, if necessary,
# updates the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, Bash attempts to save all lines of a multiple-line command in the
# same history entry. This allows easy re-editing of multi-line commands.
shopt -s cmdhist

# If set, Bash replaces directory names with the results of word expansion
# when performing filename completion. This changes the contents of the
# readline editing buffer. If not set, Bash attempts to preserve what the user
# typed.
shopt -s direxpand

# If set, Bash attempts spelling correction on directory names during word
# completion if the directory name initially supplied does not exist.
shopt -s dirspell

# If set, the extended pattern matching features described above
# (see Pattern Matching) are enabled.
shopt -s extglob

# If set, patterns which fail to match filenames during filename expansion
# result in an expansion error.
shopt -s failglob

# If set, the pattern ‘**’ used in a filename expansion context will match all
# files and zero or more directories and subdirectories. If the pattern is
# followed by a ‘/’, only directories and subdirectories match.
shopt -s globstar

# If set, shell error messages are written in the standard GNU error message
# format.
shopt -s gnu_errfmt

# If set, the history list is appended to the file named by the value of the
# HISTFILE variable when the shell exits, rather than overwriting the file.
shopt -s histappend

# If set, and Readline is being used, a user is given the opportunity to
# re-edit a failed history substitution.
shopt -s histreedit

# If set, and Readline is being used, the results of history substitution are
# not immediately passed to the shell parser. Instead, the resulting line is
# loaded into the Readline editing buffer, allowing further modification.
shopt -s histverify

# If set, Bash matches filenames in a case-insensitive fashion when performing
# filename expansion.
shopt -s nocaseglob

# If set, Bash matches patterns in a case-insensitive fashion when performing
# matching while executing case or [[ conditional commands, when performing
# pattern substitution word expansions, or when filtering possible completions
# as part of programmable completion.
shopt -u nocasematch

# Use a vi-style line editing interface. This also affects the editing
# interface used for read -e.
set -o vi
