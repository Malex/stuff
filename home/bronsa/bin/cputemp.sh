#!/bin/sh
for core in 0 1 2 3
do
	TEMP="${TEMP} $(sensors | grep "Core $core" | cut -c15-16)"
done
echo -n $TEMP
