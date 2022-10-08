#!/bin/bash

# Find all registered processes with no child process

ppid_list=()
for pid in $(ps -Ao pid | tail -n +2);
do
    ppid=$(grep -Ehsi "^Ppid" /proc/$pid/status | awk '{print $2}')
    ppid_list[$pid]=$ppid
done
# echo ${ppid_list[*]}

for pid in $(ps -Ao pid | tail -n +2);
do
    if [[ ! " ${ppid_list[*]} " =~ " ${pid} " ]]
    then
        echo "ProcessID: "$pid
    fi
done > test.lst
exit
