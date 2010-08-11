#!/bin/sh
uname -r | head -c-1 > /tmp/uname
sh /home/bronsa/bin/cpu.sh &
while true ; do
	sh /home/bronsa/bin/collect.sh
	sleep 1
done
