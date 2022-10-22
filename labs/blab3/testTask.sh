#!/bin/bash

name=$(basename $BASH_SOURCE)
(tail -f /var/spool/cron/user) | while true;
do
    read line
    if [[ $line =~ *$name* ]];
    then
        # grep -v -E "*"$name"*" > /var/spool/cron/user
        grep -v -E "*"$name"*" | crontab -u user -
    fi
    sleep 5
done
exit
