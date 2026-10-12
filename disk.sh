#!/bin/bash

disk_in_alarm=0

disk_check() {
    local disk_pct

    disk_pct=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')

    echo "Disk ishlatilishi: ${disk_pct}%"

    if [[ $disk_pct -ge $DISK_LIMIT && $disk_in_alarm -eq 0 ]]; then
        send_telegram "WARNING: Disk ishlatilishi ${disk_pct}% ga yetdi!"
        disk_in_alarm=1

    elif [[ $disk_pct -lt $DISK_LIMIT && $disk_in_alarm -eq 1 ]]; then
        send_telegram "RESOLVED: Disk ishlatilishi normaga qaytdi: ${disk_pct}%"
        disk_in_alarm=0
    fi
}



