#!/bin/bash
# Max number among the 3 console inputs

if [[ $1 -ge $2 ]]
then
    if [[ $1 -ge $3 ]]
    then echo $1;
    else echo $3;
    fi
else
    if [[ $2 -ge $3 ]]
    then echo $2;
    else echo $3;
    fi
fi
exit