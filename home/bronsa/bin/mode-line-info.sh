#!/bin/sh
uname -r | head -c-1 > /tmp/uname
sh /home/bronsa/bin/cpu.sh &
/home/bronsa/bin/net.sh 1> /dev/null &
sh /home/bronsa/bin/boinc-status.sh &
sh /home/bronsa/bin/load-avg.sh &
sh /home/bronsa/bin/gpu-temp.sh &
while true ; do
	sh /home/bronsa/bin/cputemp.sh > /tmp/cpu-temp
	sleep 1
done
