#!/bin/bash
echo -e "Report (SEQUENCED, 2 proc, N=20, R=10, memory operations) from $(echo $(date))" > exp2_seq_2proc.log
: > exp2full_seq_2proc.log
repeat=10
NMax=20
for i in $(seq 1 $NMax); do
    all_time=0
    for r in $(seq 1 $repeat); do
        for file_N in $(seq 1 $i); do
            cp memoryData/data memoryData/data$file_N
        done
        current_time=$( TIMEFORMAT="%R"; { time ./memrunner_seq.sh $i; } 2>&1 )
        echo $current_time >> exp2full_seq_2proc.log
        all_time=$( echo "$all_time + $current_time" | bc -l )
        if [[ $r -eq $repeat ]]; then
            mean_time=$(echo "${all_time}/${repeat}" | bc -l)
            echo "$mean_time" >> exp2_seq_2proc.log
            echo "Mean Time for N="$i": "$mean_time >> exp2full_seq_2proc.log
        fi
    done
    echo
done