#!/bin/bash

THRESHOLD=${1:-80}

LOGFILE="/var/log/disk.log"

CURRENT_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
    echo "$(date): WARNING - Disk usage is at ${CURRENT_USAGE}% on /" >> $LOGFILE
fi