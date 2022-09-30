#!/bin/bash

userprocess=$(ps -A u | awk '$1 == "user" {print $2 " " $11}')
cnt=$(echo "$userprocess" | wc --lines)
echo -e "$cnt\n$userprocess" > i.lst
exit

# userprocess=$(ps -U root -u root,user u  | awk '$1 -eq "user" {print $2 " " $11}')
