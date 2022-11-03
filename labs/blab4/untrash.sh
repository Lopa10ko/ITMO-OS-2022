#!/bin/bash

trashdir=~/.trash
trashlog=~/.trash.log
if [[ "$#" -ne 1 ]]; then echo "Invalid ARGS: 1 filename needed" && exit 1; fi

untrash_file() {
    path=$1
    filename=$2
    ln "$trashdir/$filename" $path
}

filename=$1
grep $filename $trashlog | while read line;
do
    filepath=$(echo $line | cut -d " " -f 1)
    filelog=$(echo $line | cut -d " " -f 2)
    echo -e "Restore ($filelog) to ($filepath)?\n(Y/N)"
    read answer < /dev/tty
    case $answer in
    "Y")
        origindir=$(dirname "$filepath") &&
        if [[ -d "$origindir" ]]; then
            $(untrash_file "$filepath" "$filelog")
        else
            $(untrash_file "$HOME/$filename" "$filelog") &&
            echo "Untrash to $HOME directory due to $origindir directory corruption"
        fi && rm $trashdir/$filelog && echo "$filepath restored!"
    ;;
    "N")
        continue;
    ;;
    *)
        echo "Invalid answer: Y or N expected"
    ;;
    esac
done
