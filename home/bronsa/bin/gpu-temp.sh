#/bin/sh
while true ; do
	aticonfig --adapter=0 --od-gettemperature | tai    l -n 1 | cut -c 36-38 | head -c-1 > /tmp/gpu-temp
	sleep 1
done
