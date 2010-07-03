#!/bin/sh
for core in 0 1 2 3
do
	echo -n $(sensors | grep "Core $core" | cut -c15-16) ""
done
