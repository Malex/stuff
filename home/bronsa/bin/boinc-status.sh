#!/bin/sh
while true; do
	/etc/init.d/boinc status | cut -c 11- | head -c -1 > /tmp/boinc-status
	sleep 1;
done
