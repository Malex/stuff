#!/bin/sh
while true ; do
	uptime | tail -c17 | cut -c 1-4 | head -c-1 > /tmp/load-avg
	sleep 1
done
