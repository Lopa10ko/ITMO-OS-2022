#!/bin/bash

file=$1
lines=$( wc -l $file | awk '{print $1}' )
i=0
while [ $i -lt $lines ] && read -r line; do
    current=$(echo "$line" | tr -dc '0-9')
    (( multiplied_current = $current * 2 ))
    echo "$multiplied_current" >> "$file"
    (( ++i ))
done < "$file"
