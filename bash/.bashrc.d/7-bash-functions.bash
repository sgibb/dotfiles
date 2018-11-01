function backup {
  test -e ${1} && cp -av ${1} ${1}_$(date +%Y%m%d_%H%M%S)
}
