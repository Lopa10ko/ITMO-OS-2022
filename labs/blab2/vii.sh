#!/bin/bash

init_data=()
pid_list=()
commands=()
for pid in $(ps -Ao pid | tail -n+2)
do
    if [[ -r /proc/"$pid"/io ]]
    then
        init_data[$pid]=$(grep -s "rchar" /proc/"$pid"/io | grep -o "[[:digit:]]\+")
        commands[$pid]=$(cat /proc/$pid/cmdline | tr -d "\0") # ignored null byte
        pid_list[$pid]=$pid
    fi
done
sleep 1m
new_data=()
for pid in $(ps -Ao pid | tail -n+2)
do
    if [[ -r /proc/"$pid"/io ]]
    then new_data[$pid]=$(grep -s "rchar" /proc/"$pid"/io | grep -o "[[:digit:]]\+"); fi
done

# echo ${init_data[*]}
# echo ${new_data[*]}
for pid in "${pid_list[@]}"
do
    echo $pid" : "$(echo $((${new_data[$pid]}-${init_data[$pid]})) )" : " ${commands[$pid]}
done | sort -nrk3 | head -3 | tee vii.lst

exit
