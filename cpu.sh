#!/bin/bash

cpu_in_alarm=0

send_telegram() {
    local message="$1"

    curl -s -X POST \
        "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
        -d "chat_id=${CHAT_ID}" \
        --data-urlencode "text=${message}" >/dev/null
}
cpu_check(){
    local load
    local load_pct
     load=$(uptime | awk -F'load average: ' '{ print $2 }' |awk -F ', ' '{ print $1 }')
     load_pct=$( echo "$load * 100 / $(nproc )" |bc)
 
    if [[ $load_pct -ge ${CPU_LIMIT} && $cpu_in_alarm -eq 0 ]]; then 
	   send_telegram "WARNING: CPU ${load_pct}% ga yetdi!"
	   cpu_in_alarm=1

   elif [[ $load_pct -lt ${CPU_LIMIT} && $cpu_in_alarm -eq 1 ]]; then
           send_telegram "RESOLVED: CPU normal holatga qaytdi: ${load_pct}%"
           cpu_in_alarm=0
    fi	   
     

}
  

 


