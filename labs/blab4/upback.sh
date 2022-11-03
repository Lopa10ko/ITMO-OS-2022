#!/bin/bash

destinationDir=~/restore
lastBackup=$HOME/$(ls ~ | grep -e "^Backup-" | sort -nr | head -1)
lastBackupDate=$(echo $lastBackup | sed "s/^Backup-//")
if [[ ! -z $(echo $lastBackup | sed "s/^Backup-//") ]]; then
    [[ -d destinationDir ]] || mkdir $destinationDir
    for curFile in $(ls $lastBackup | grep -E -v "[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}");
    do
        cp $lastBackup/$curFile $destinationDir/$curFile
    done
fi
