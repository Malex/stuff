#!/bin/sh
while true ; do
#	CPULOAD=$(cat /tmp/cpu)
	CPUTEMP=$(sh /home/bronsa/bin/cputemp.sh)
	GPUTEMP=$(aticonfig --adapter=0 --od-gettemperature | tail -n 1 | cut -c 36-38 | head -c-1)
	LOADAVG=$(uptime | tail -c17 | cut -c 1-4 | head -c-1)
#	NETIN=$(cat /tmp/net.in)
#	NETOUT=$(cat /tmp/net.out)
	UNAME=$(uname -r | head -c-1)
	FILE="(:|CPUTEMP| \"${CPUTEMP}\" :|GPUTEMP| \"${GPUTEMP}\" :|LOADAVG| \"${LOADAVG}\" :|UNAME| \"${UNAME}\")"
	echo -en "\n${FILE}" > /tmp/data
	sleep 0.5
done
