#!/bin/bash

ram_in_alarm=0

ram_check() {
    local total
    local used
    local ram_pct

total=$(free | awk '/Mem:/ {print $2}')
used=$(free | awk '/Mem:/ {print $3}')
ram_pct=$((used*100/total))

if [[ $ram_pct -ge $RAM_LIMIT && $ram_in_alarm -eq 0 ]]; then
    send_telegram "WARNING: RAM ishlatilishi ${ram_pct}% ga yetdi!"
    ram_in_alarm=1

elif [[ $ram_pct -lt $RAM_LIMIT && $ram_in_alarm -eq 1 ]]; then
    send_telegram "RESOLVED: RAM ishlatilishi normaga qaytdi: ${ram_pct}%"
    ram_in_alarm=0
fi

}
