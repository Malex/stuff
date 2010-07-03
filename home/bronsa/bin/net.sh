#!/bin/bash

FILE=/tmp/netstat
VFILE="${FILE}v"
touch "${FILE}" "${VFILE}"

speed ()
{
    [ "$#" = "2" ] || return 1
    echo "(${1} - ${2})" | bc && return 0 || return 1
}

echo -n > "${VFILE}"
cat /proc/net/dev | grep -v '|' | \
while read line; do
    echo OLD_$(echo "${line}" | awk -F: '{print $1}')_UP=0 >> "${VFILE}"
    echo OLD_$(echo "${line}" | awk -F: '{print $1}')_DOWN=0 >> "${VFILE}"
done
. ${VFILE}
rm ${VFILE}

while true; do
    . ${VFILE} 2>/dev/null
    rm ${VFILE} 2>/dev/null
    echo -n > "${FILE}" && echo -n > "${VFILE}"
    cat /proc/net/dev | grep -v '|' | \
    while read line; do
        INTERFACE="$(echo "${line}" | awk -F: '{print $1}')"
        eval "NEW_${INTERFACE}_UP=\"$(echo "${line}" | awk -F" " '{print $2}')\""
        eval "NEW_${INTERFACE}_DOWN=\"$(echo "${line}" | awk -F" " '{print $10}')\""

        echo "${INTERFACE}:$(eval "speed \"\${NEW_${INTERFACE}_UP}\" \"\${OLD_${INTERFACE}_UP}\"")-$(eval "speed \"\${NEW_${INTERFACE}_DOWN}\" \"\${OLD_${INTERFACE}_DOWN}\"")" | tee -a "${FILE}"
        eval "echo \"OLD_${INTERFACE}_UP=\\\"\${NEW_${INTERFACE}_UP}\\\"\"" >> "${VFILE}"
        eval "echo \"OLD_${INTERFACE}_DOWN=\\\"\${NEW_${INTERFACE}_DOWN}\\\"\"" >> "${VFILE}"
    done
	net=$(cat /tmp/netstat | grep eth1 | cut -c 6-)

	echo -n $((${net%-*} /1024))"."$((${net%-*} %1024))> /tmp/net.in
	echo -n $((${net#*-} /1024))"."$((${net%-*} %1024)) > /tmp/net.out
	sleep 1
done

