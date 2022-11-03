#!/bin/bash

if [[ "$#" -ne 1 ]]; then echo "Invalid ARGS for files quantity: 1 needed" && exit 1; fi
if [[ "$#" -lt 0 ]]; then echo "Invalid ARGV for files quantity: positive integer needed" && exit 1; fi
echo -e "Generated files:"
for (( i=0; i < $1; i++ ))
do
    touch test$i.txt
    echo ${RANDOM:0:2} > test$i.txt
    echo "test$i.txt"
done
exit
