_INTERVAL="1"  # update interval in seconds

function NetSpeed() {
  about 'net speed stat'
  param '1: network interface'
  example 'NetSpeed eth0'
  example 'NetSpeed lo'
  group 'net'

  if [ -z "$1" ]; then
    echo
    echo usage: $0 <network-interface>
    echo
    echo e.g. $0 eth0
    echo
    return
  fi

  local IF=$1

  while true
  do
    local R1=`cat /sys/class/net/$1/statistics/rx_bytes`
    local T1=`cat /sys/class/net/$1/statistics/tx_bytes`
    sleep $_INTERVAL
    local R2=`cat /sys/class/net/$1/statistics/rx_bytes`
    local T2=`cat /sys/class/net/$1/statistics/tx_bytes`
    local TBPS=`expr $T2 - $T1`
    local RBPS=`expr $R2 - $R1`
    local TKBPS=`expr $TBPS / 1024`
    local RKBPS=`expr $RBPS / 1024`
    echo "TX $1: $TKBPS kb/s RX $1: $RKBPS kb/s"
  done
}

function NetPacket() {
  about 'net packets stat'
  param '1: network interface'
  example 'NetPacket eth0'
  example 'NetPacket lo'
  group 'net'

  if [ -z "$1" ]; then
    echo
    echo usage: $0 <network-interface>
    echo
    echo e.g. $0 eth0
    echo
    echo shows packets-per-second
    return
  fi

  local IF=$1

  while true
  do
    local R1=`cat /sys/class/net/$1/statistics/rx_packets`
    local T1=`cat /sys/class/net/$1/statistics/tx_packets`
    sleep $_INTERVAL
    local R2=`cat /sys/class/net/$1/statistics/rx_packets`
    local T2=`cat /sys/class/net/$1/statistics/tx_packets`
    local TXPPS=`expr $T2 - $T1`
    local RXPPS=`expr $R2 - $R1`
    echo "TX $1: $TXPPS pkts/s RX $1: $RXPPS pkts/s"
  done
}

function NetStat() {
  about 'net connections stat'
  group 'net'
  
  netstat -n | awk '/^tcp/ {++state[$NF]} END {for(key in state) print key,"\t",state[key]}'
}
