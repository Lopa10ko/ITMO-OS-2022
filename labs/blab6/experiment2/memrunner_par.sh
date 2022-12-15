#!/bin/bash

[ $# -ne 1 ] && exit 1
for i in $(seq 1 $1); do
    ./memalgo.sh memoryData/data$i &
done

while true; do
    top_parse=$( top -b -n 1 | grep algo.sh | wc -l )
    if [ $top_parse -eq 0 ]; then
        break
    fi
done