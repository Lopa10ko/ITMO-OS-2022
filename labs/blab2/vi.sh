#!/bin/bash

memmax=0
answerpid=0
for pid in $(ps -Ao pid)
do
    if [[ -r /proc/$pid/status ]]
    then
        current=$(grep -s "VmRSS:" /proc/$pid/status | grep -o "[[:digit:]]\+")
        if [ -n $current ] && [[ $current -gt $memmax ]]
        then memmax=$current; answerpid=$pid; fi
    fi
done
echo -e "Result from script:\n"$answerpid" : "$memmax
echo -e "Result from top:\n"$(top -o %MEM -n 1 | awk '{print $2}' | awk 'NR==8')
exit
