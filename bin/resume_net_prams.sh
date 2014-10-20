#!/bin/bash

echo 60 > /proc/sys/net/ipv4/route/gc_interval
echo 300 > /proc/sys/net/ipv4/route/gc_timeout
echo 8 > /proc/sys/net/ipv4/route/gc_elasticity
echo 4096	16384	4194304 > /proc/sys/net/ipv4/tcp_wmem
echo 2048 > /proc/sys/net/ipv4/tcp_max_syn_backlog
echo 128 > /proc/sys/net/core/somaxconn
echo 262144 > /proc/sys/net/ipv4/tcp_max_tw_buckets
echo 15 > /proc/sys/net/ipv4/tcp_retries2
echo 688224	917632	1376448 > /proc/sys/net/ipv4/tcp_mem
echo 1 > /proc/sys/net/ipv4/tcp_timestamps
echo 1 > /proc/sys/net/ipv4/tcp_window_scaling
echo 1 > /proc/sys/net/ipv4/tcp_sack
echo 262144 > /proc/sys/net/ipv4/tcp_max_orphans
echo 32768	61000 > /proc/sys/net/ipv4/ip_local_port_range
echo 728958 > /proc/sys/fs/file-max
