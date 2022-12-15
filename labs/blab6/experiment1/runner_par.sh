#!/bin/bash
# N - quantity of running jobs
for i in $(seq 1 $1); do
    ./algo.sh &
done

while true; do
    top_parse=$( top -b -n 1 | grep algo.sh | wc -l )
    if [ $top_parse -eq 0 ]; then
        break
    fi
done
