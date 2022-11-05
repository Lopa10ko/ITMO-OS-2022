#!/bin/bash

destinationDir=~/testrestore
echo "Backups to restore:"
backups=($(ls ~ | grep -e "^Backup-" | sort -nr))
cnt="0"
for i in ${backups[*]}; do
    echo "$(( $cnt+1 ))) $i"
    let cnt++;
done
read answer
if [ $answer -lt 1 -o $answer -gt $cnt ]; then
    echo "Invalid Backup id: needed positive integer not greater than "$cnt
    exit 1
fi
neededBackup=$HOME/${backups[$answer-1]}
echo -e "\nrestoring $neededBackup..."
if [[ ! -z $(echo $neededBackup | sed "s/^Backup-//") ]]; then
    [[ -d destinationDir ]] || mkdir $destinationDir
    for curFile in $(ls $neededBackup | grep -E -v "[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}");
    do
        cp $neededBackup/$curFile $destinationDir/$curFile
    done
    echo "$neededBackup restored!"
fi
