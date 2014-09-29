readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(readlink -m $(dirname $0))
readonly ARGS=$@
readonly ARGC=$#

function idie() {
  echo "$1 [at line `caller`]" >2 && exit 1
}

function icheck() {
  test $@
  if [ $? -ne 0 ]; then
    echo "$@ check failed [at line `caller`]" >2 && exit 1
  fi
}

function iautopass() {
  Check $# -eq 2
  local cmd="$1"
  local password="$2"
  expect -c "
    spawn $cmd
    expect {
      \"yes/no\"  {send \"yes\r\" ; exp_continue}
      \"*assword:\" {send \"$password\n\"; interact}
    }
  "
}

function iget_config() {
  local config=$1
  local key=$2
  echo "`cat $config | grep $key | awk -F "=" '{print$2}' | tr -d ' '`"
}
