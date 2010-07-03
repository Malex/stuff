#!/bin/sh
uptime=$(cat /proc/uptime | awk -F '.' {'print $1'})
echo -n "0$(($uptime/3600)):0$(($uptime/60%60)):0$(($uptime%60%60))" | sed "s/0\([0-9][0-9]\)/\1/g"
