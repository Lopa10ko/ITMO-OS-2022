#!/bin/bash

while true;
do
    read line
    echo "$line" > pipe
    if [[ "$line" == "QUIT" ]]
    then
        echo "EXIT: via QUIT (gen)"
        exit
    fi
    if ! [[ "$line" =~ ^[[:digit:]]+ ]] && [[ "$line" != "+" && "$line" != "*" ]];
    then
        echo "EXIT: Invalid operation (gen)"
        exit 1
    fi
done
