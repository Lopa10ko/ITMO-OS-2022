#!/bin/bash

backupsFolder=$(ls $HOME/*/ | grep -o -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")
lastBackupTimeInSeconds=0
lastBackupFolder=""
source="$HOME/source"
report="$HOME/backup-report"

if [[ $backupsFolder ]]; then
    lastBackupFolder=$(echo "$backupsFolder" | tail -1)
    lastBackupDate=$(echo "$lastBackupFolder" | grep -o -E "[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")
    lastBackupTimeInSeconds=$(date -d $lastBackupDate +%s)
fi

[[ -d "$source" ]] || { echo "Source directory does not exist"; exit 1; }

nowDate=$(date +%Y-%m-%d)
nowDateSeconds=$(date -d $nowDate +%s)
BackupFolder=""
isBackupNew=false

if [[ $nowDateSeconds -gt $lastBackupTimeInSeconds+7*24*60*60 ]]; then
    BackupFolder="$HOME/Backup-$nowDate"
    mkdir $BackupFolder
    isBackupNew=true
else
    BackupFolder="$HOME/$lastBackupFolder"
fi

cd "$source"
filesToBackup=$(find . -type f)

if [[ $isBackupNew == true ]]; then
    echo "$BackupFolder: created -- $current_time" >> $report
    for curFile in $filesToBackup
    do
        cp --parents "$curFile" "$BackupFolder/"
        echo "$curFile copied to $BackupFolder -- $nowDate" >> $report
    done
else
    for curFile in $filesToBackup
    do
        if [[ -e "$BackupFolder/$curFile" ]]; then
            if [[ $(stat -c%s "$BackupFolder/$curFile") -ne $(stat -c%s "$source/$curFile") ]]; then
                mv "$BackupFolder/$curFile" "$BackupFolder/$curFile.$nowDate"
                cp "$source/$curFile" "$BackupFolder/$curFile"
                echo "$curFile renamed to $curFile.$nowDate -- $nowDate" >> $report
                echo "$curFile copied to $BackupFolder -- $nowDate" >> $report
            fi
        else
            cp --parents "$curFile" "$BackupFolder/"
            echo "$curFile copied to $BackupFolder -- $nowDate" >> $report
        fi
    done
fi
