#!/bin/bash

# ------------------
# Script for disk space monitoring
# and sending alert to personal mail
# id if usage is greator than 80%
# ------------------


threshold=80

to="user@gmail.com"
subject="Disk Space Alert on $(hostname)"

check_disk_usage() {
        df -h | while read line; do
                if [[ "$line" == Filesystem* ]]; then
                        continue
                fi

                partition=$(echo $line | awk '{print $1}')
                usage=$(echo $line | awk '{print $5}' | tr -d '%')

                if [ "$usage" -gt "$threshold" ]; then
                        message="Warning: Disk usage on $partition is at $usage % on $hostname."
                        echo -e "Subject: $subject\n\n$message" | sendmail $to
                fi
        done
}

check_disk_usage