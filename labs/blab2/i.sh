#!/bin/bash

userprocess=$(ps a u -u user | awk '$1 -eq "user" {print $2 " " $11}')
cnt=$(echo "$userprocess" | wc --lines)
echo -e "$cnt\n$userprocess" > i.lst
exit
