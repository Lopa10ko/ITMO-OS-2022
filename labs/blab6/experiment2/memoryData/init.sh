#!/bin/bash

: > data
for i in $(seq 1 $1); do
    echo "1" | tee -a data >/dev/null
done
