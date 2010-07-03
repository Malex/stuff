#!/bin/bash

PREV_TOTAL=0
PREV_IDLE=0
touch /tmp/cpu

while true; do
	CPU=(`cat /proc/stat | grep '^cpu '`)
	unset CPU[0]
	IDLE=${CPU[4]}

	TOTAL=0
	for VALUE in "${CPU[@]}"; do
		TOTAL=`echo "scale=2;$TOTAL + $VALUE" | bc`
	done
	
	DIFF_IDLE=`echo "scale=2;$IDLE - $PREV_IDLE" | bc`
	DIFF_TOTAL=`echo "scale=2;$TOTAL - $PREV_TOTAL" | bc`
	DIFF_USAGE=`echo "scale=1;100 * ($DIFF_TOTAL - $DIFF_IDLE) / $DIFF_TOTAL" | bc`

	echo -n "$DIFF_USAGE%" > /tmp/cpu

	PREV_TOTAL=$TOTAL
	PREV_IDLE=$IDLE
	sleep 1
done

