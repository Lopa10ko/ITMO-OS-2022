#!/bin/bash

value=1
operation="+"
echo "Current operation: +"
(tail -f pipe ; pid=$!) | while true;
do
    read line
    case "$line" in
        [\*\+])
            operation=$line
            echo "Current operation: "$line
        ;;
        "QUIT")
            kill $pid 2>/dev/null
            echo "EXIT: via QUIT (logic)"
            exit 0
        ;;
        *)
            if [[ "$line" =~ ^[[:digit:]]+ ]] 2>/dev/null
            then
                case $operation in
                    "+")
                        let value=$value\+$line
                        echo $value
                    ;;
                     "*")
                        let value=$value\*$line
                        echo $value
                    ;;
                esac
            else
                kill $pid 2>/dev/null
                echo "EXIT: Invalid operation (logic)"
                exit 1
            fi
        ;;
    esac
done
