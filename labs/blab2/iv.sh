#!/bin/bash

for pid in $(ps -Ao pid | tail -n +2);
do
    ppid=$(grep -Ehsi "^Ppid" /proc/$pid/status | awk '{print $2}')
    sum_exec_runtime=$(grep -Ehsi "se\.sum_exec_runtime(.+):\s+(.+)" /proc/$pid/sched | awk '{print $3}')
    nr_switches=$(grep -Ehsi "^nr_switches" /proc/$pid/sched | awk '{print $3}')

    if [ -z $ppid ]; then ppid=0; fi
    if [ -z ${sum_exec_runtime} ] || [ -z ${nr_switches} ]; then art=0
    else
        art=$(echo "${sum_exec_runtime}/${nr_switches}" | bc -l)
    fi
    echo "$pid $ppid $art"
done | sort -n -k 2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3}' | tee iv.lst
exit
