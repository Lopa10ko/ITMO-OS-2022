#!/bin/bash

declare -a array
while true; do
    array+=(1 2 3 4 5 6 7 8 9 10)
    if [[ "${#array[@]}" -gt $1 ]]; then
        echo "reached array limit and stopped"
        exit 0
    fi
done
