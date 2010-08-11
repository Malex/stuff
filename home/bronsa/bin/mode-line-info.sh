#!/bin/sh
uname -r | head -c-1 > /tmp/uname
while true ; do
	sh /home/bronsa/bin/collect.sh
	sleep 1
done
