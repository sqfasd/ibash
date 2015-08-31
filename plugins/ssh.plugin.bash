cite about-plugin
about-plugin 'ssh helper functions'
_RSA_PUB_FILE=id_rsa.pub
_RSA_PUB_PATH=$HOME/.ssh/$_RSA_PUB_FILE
_SSH_HOST_LIST=$HOME/.ssh/host_list

function isshadd() {
  about 'add entry to ssh config'
  param '1: short name of the host'
  param '2: host name'
  param '3: user'
  group 'ssh'

  if [ $# -ne 3 ]; then
    echo "usage: $0 <shortname> <host> <user>"
    return
  fi

  ssh-copy-id $3@$2
  echo "$1=$3@$2" >> $_SSH_HOST_LIST
}

function isshlist() {
  about 'list hosts defined in ssh config'
  group 'ssh'

  test -e $_SSH_HOST_LIST && cat $_SSH_HOST_LIST
}

function issh() {
  about 'use host short name to ssh'
  group 'ssh'

  local hostname=`iget_config $_SSH_HOST_LIST $1`
  ssh $hostname
}
