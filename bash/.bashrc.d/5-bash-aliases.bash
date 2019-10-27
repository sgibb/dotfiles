alias ..='cd ..'
alias ~='cd ~'
alias -- -='cd -'

alias l='ls -1'
alias ll='ls -l'
# List all size human readable
alias la='ls -ah'
# List all order by lastmod, size human readable
alias lt="ls -lth"

alias git='LANG=en_US git'
alias R='LANGUAGE=en ${HOME}/bin/Rdevel --no-save'

alias a='khal list today 7d'
alias e='nvim'
alias t='todoman'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias exifrm='exiftool -all= '

alias ocrpdfde='ocrmypdf --language "deu" --deskew --rotate-pages --clean --clean-final --remove-background --output-type pdfa'
alias ocrpdfen='ocrmypdf --language "eng" --deskew --rotate-pages --clean --clean-final --remove-background --output-type pdfa'
