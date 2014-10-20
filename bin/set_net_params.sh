#!/bin/bash
echo 1 > /proc/sys/net/ipv4/route/gc_interval 
echo 150 >/proc/sys/net/ipv4/route/gc_timeout 
echo 2 >/proc/sys/net/ipv4/route/gc_elasticity 
echo "4096 49152 131072" >/proc/sys/net/ipv4/tcp_wmem 
echo 1000 >/proc/sys/net/ipv4/tcp_max_syn_backlog 
echo 1000 >/proc/sys/net/core/somaxconn 
echo 1200000 > /proc/sys/net/ipv4/tcp_max_tw_buckets 
echo 7 >/proc/sys/net/ipv4/tcp_retries2 
echo "600000 650000 700000" >/proc/sys/net/ipv4/tcp_mem 
echo 0 >/proc/sys/net/ipv4/tcp_timestamps 
echo 0 >/proc/sys/net/ipv4/tcp_window_scaling 
echo 0 >/proc/sys/net/ipv4/tcp_sack 
echo 330000 >/proc/sys/net/ipv4/tcp_max_orphans 
echo "10000 62000" >/proc/sys/net/ipv4/ip_local_port_range 
echo 1300000 >/proc/sys/fs/file-max 
