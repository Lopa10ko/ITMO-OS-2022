#!/bin/bash
# N - quantity of running jobs
for i in $(seq 1 $1); do
    ./algo.sh
done