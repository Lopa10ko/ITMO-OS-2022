#!/bin/bash
echo -e "Report (Parallel, 2 proc, N=20, R=10) from $(echo $(date))" > exp1_par_new2.log
: > exp1full_par_new2.log
repeat=10
NMax=20
for i in $(seq 1 $NMax); do
    all_time=0
    for r in $(seq 1 $repeat); do
        current_time=$( TIMEFORMAT="%R"; { time ./runner_par.sh $i; } 2>&1 )
        echo $current_time >> exp1full_par_new2.log
        all_time=$( echo "$all_time + $current_time" | bc -l )
        if [[ $r -eq $repeat ]]; then
            mean_time=$(echo "${all_time}/${repeat}" | bc -l)
            echo "$mean_time" >> exp1_par_new2.log
            echo "Mean Time for N="$i":"$mean_time >> exp1full_par_new2.log
        fi
    done
    echo
done