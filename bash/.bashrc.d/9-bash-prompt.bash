# inspired by https://github.com/sindresorhus/pure/blob/master/pure.zsh
function .prompt {
    local EXITSTATUS="$?"

    local GRAY="\[$(tput setaf 240)\]"
    local RED="\[$(tput setaf 196)\]"
    local GREEN="\[$(tput setaf 34)\]"
    local YELLOW="\[$(tput setaf 229)\]"
    local BLUE="\[$(tput setaf 33)\]"
    local RESET="\[$(tput sgr0)\]"

    local EXITCOLOR="${GREEN}"
    [[ "${EXITSTATUS}" -ne 0 ]] && EXITCOLOR="${RED}"

    local HOSTCOLOR="\[$(tput setaf $(($(hostname | cksum | cut -c1-3) % 256)))\]"

    PS1=""

    [[ "${SSH_CONNECTION}" != '' ]] && PS1+="${GRAY}\u@${HOSTCOLOR}\h${RESET}:"
    [[ ${UID} -eq 0 ]] && PS1+="${RED}\u@${HOSTCOLOR}\h${RESET}:"

    PS1+="${BLUE}\w${RESET}\["

    local BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

    if [ ! -z ${BRANCH} ]; then
        PS1+="${YELLOW}${BRANCH}${RESET}"
        if [ ! -z "$(git status --short)" ]; then
            PS1+="${RED}✗${RESET}"
        fi
    fi

    PS1+="\]\n${EXITCOLOR}❯${RESET} "
    PS2="❯ "
}
PROMPT_COMMAND=".prompt"
