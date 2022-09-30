#!/bin/bash

# for pid in $(ps -Ao pid | tail -n +2);
# do
#     ppid=$(grep -Ehsi "^Ppid" /proc/$pid/status | awk '{print $2}')
#     sum_exec_runtime=$(grep -Ehsi "se\.sum_exec_runtime(.+):\s+(.+)" /proc/$pid/sched | awk '{print $3}')
#     nr_switches=$(grep -Ehsi "^nr_switches" /proc/$pid/sched | awk '{print $3}')

#     if [ -z $ppid ]; then ppid=0; fi
#     if [ -z ${sum_exec_runtime} ] || [ -z ${nr_switches} ]; then art=0
#     else
#         art=$(echo "${sum_exec_runtime}/${nr_switches}" | bc -l)
#     fi
#     echo "$pid $ppid $art"
# done | sort -n -k 2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3}' | tee iv.lst
# exit

previous=0
sum=0
cnt=0
echo -e "$(<iv.lst)" | tr "=" " " | while read -r line
do
    pid=$(echo $line | awk '{print $2}')
    ppid=$(echo $line | awk '{print $5}')
    art=$(echo $line | awk '{print $8}')
    if [[ $ppid -eq $previous ]]
    then
        echo $line >> v.lst
        sum=$(echo "$sum+$art" | bc -l)
        ((cnt++))
    else
        mean_art=$(echo "${sum}/${cnt}" | bc -l)
        echo "Average_Running_Children_of_ParentID="$previous" is "${mean_art}
        sum=${mean_art}; cnt=1; previous=$ppid
    fi
    echo "ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Running_Time="$art
done > v.lst
echo "Average_Running_Children_of_ParentID="$previous" is "${mean_art} >> v.lst
exit
