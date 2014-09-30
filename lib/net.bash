_INTERVAL="1"  # update interval in seconds

function inetspeed() {
  about 'net speed stat'
  param '1: network interface (optional, default is eth0)'
  example 'inetspeed'
  example 'inetspeed eth0'
  example 'inetspeed lo'
  group 'net'

  local IF=eth0
  if [ -n "$1" ]; then
    IF=$1
  fi

  while true
  do
    local R1=`cat /sys/class/net/$IF/statistics/rx_bytes`
    local T1=`cat /sys/class/net/$IF/statistics/tx_bytes`
    sleep $_INTERVAL
    local R2=`cat /sys/class/net/$IF/statistics/rx_bytes`
    local T2=`cat /sys/class/net/$IF/statistics/tx_bytes`
    local TBPS=`expr $T2 - $T1`
    local RBPS=`expr $R2 - $R1`
    local TKBPS=`expr $TBPS / 1024`
    local RKBPS=`expr $RBPS / 1024`
    echo "TX $IF: $TKBPS kb/s RX $IF: $RKBPS kb/s"
  done
}

function inetpacket() {
  about 'net packets stat'
  param '1: network interface (optional, default is eth0)'
  example 'inetpacket'
  example 'inetpacket eth0'
  example 'inetpacket lo'
  group 'net'

  local IF=eth0
  if [ -n "$1" ]; then
    IF=$1
  fi

  while true
  do
    local R1=`cat /sys/class/net/$IF/statistics/rx_packets`
    local T1=`cat /sys/class/net/$IF/statistics/tx_packets`
    sleep $_INTERVAL
    local R2=`cat /sys/class/net/$IF/statistics/rx_packets`
    local T2=`cat /sys/class/net/$IF/statistics/tx_packets`
    local TXPPS=`expr $T2 - $T1`
    local RXPPS=`expr $R2 - $R1`
    echo "TX $IF: $TXPPS pkts/s RX $IF: $RXPPS pkts/s"
  done
}

function inetstat() {
  about 'net connections stat'
  group 'net'
  
  netstat -n | awk '/^tcp/ {++state[$NF]} END {for(key in state) print key,"\t",state[key]}'
}
