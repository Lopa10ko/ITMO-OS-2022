#!/bin/bash

echo $$ > .pid
value=1
operation="+"
usr1()
{
    operation="+"
}
usr2()
{
    operation="*"
}
term()
{
    operation="TERM"
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM

while true;
do
    case $operation in
        "+")
            let value=$value\+2
            echo "$value"
        ;;
        "*")
            let value=$value\*2
            echo "$value"
        ;;
        "TERM")
            echo "EXIT: via TERM (logic)"
            exit 1
        ;;
    esac
    sleep 5
done
