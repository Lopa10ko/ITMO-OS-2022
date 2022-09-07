#!/bin/bash

read string
while [[ "$string" != "q" ]]; do
answer+="$string"
read string
done
echo $answer
exit