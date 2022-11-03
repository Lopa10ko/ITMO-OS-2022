#!/bin/bash

if [[ "$#" -ne 1 ]]; then echo "Invalid ARGS: 1 filename needed" && exit 1; fi
if [[ ! -f $1 ]]
then
    if [[ -L $1 ]]
    then
        printf '%s is a broken symlink!\n' "$1"
    else
        printf '%s does not exist!\n' "$1"
    fi
fi

trashdir=~/.trash
trashlog=~/.trash.log
[ -e $trashdir ] || mkdir $trashdir
[ -f $trashlog ] || touch $trashlog

# linkval=$(ls ~/.trash | cat | grep "^[[:digit:]]\+$" | sort -n -r -k1)
linkval=$1-$(date +%s%3N)
ln $1 $trashdir/$linkval
rm $1 && echo $(realpath $1) $linkval >> $trashlog
