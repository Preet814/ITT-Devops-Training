#!/bin/bash


# -----------------
# Script to backup files
# folders from home to
# backup folder.
# -----------------


source="/home/"
destination="/backup/"
log_file="/var/log/backup.log"

if [ ! -d "$destination" ]; then
        sudo mkdir -p "$destinaiotn"
fi

if [ ! -f "$log_file" ]; then
        sudo touch "$log_file"
fi

sudo rsync -av --delete "$source" "$destination"

if [ $? -eq 0 ]; then
        echo "Backup successful at $date" | sudo tee -a "$log_file" > /dev/null
else
        echo "Backup unsuccessful at $date" | sudo tee -a "$log_file" > /dev/null
fi