#!/bin/bash

# dir="/var/log/anaconda/syslog"
# awk '$2 == "(INFO)" {print}' $dir >> info.log
# exit

while read line; do
if [[ "INFO" == $(echo $line | cut -d ' ' -f 2) ]]
then echo $line >> info.log
fi
done < /var/log/anaconda/syslog
exit