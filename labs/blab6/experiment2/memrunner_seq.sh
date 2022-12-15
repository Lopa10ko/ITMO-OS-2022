#!/bin/bash

[ $# -ne 1 ] && exit 1
for i in $(seq 1 $1); do
    ./memalgo.sh memoryData/data$i
done