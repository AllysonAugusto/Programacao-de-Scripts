#!/usr/bin/awk -f

{
    ip = $0
    "ping -c 10 " ip " | tail -n 1 | awk -F'/' '{print $5}'" | getline time
    print ip, time "ms"
}

