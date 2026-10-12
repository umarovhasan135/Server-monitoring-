#!/bin/bash

 set -euo pipefail

 script_dir=$(dirname "$(readlink -f "$0")")

 source "${script_dir}/monitoring.conf"
 source "${script_dir}/cpu.sh"
 source "${script_dir}/ram.sh"
 source "${script_dir}/disk.sh"

 touch "${script_dir}/running"
 trap 'rm -f "${script_dir}/running"' EXIT
 
while [[ -f "${script_dir}/running" ]];
 do
 cpu_check
 ram_check
 disk_check 
  sleep $INTERVAL
 done
 

