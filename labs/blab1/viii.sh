#!/bin/bash

echo "" > test.log
while read line; do
echo $line | cut -d ":" -f 1,3 | tr ":" " "  >> test.log
done < /etc/passwd
sort -n --key=2 --output=test.log test.log
exit
