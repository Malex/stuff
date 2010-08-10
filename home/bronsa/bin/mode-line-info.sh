#!/bin/sh
uname -r | head -c-1 > /tmp/uname
sh /home/bronsa/bin/cpu.sh &
/home/bronsa/bin/net.sh 1> /dev/null &
while true ; do
	sh /home/bronsa/bin/collect.sh
	sleep 1
done
