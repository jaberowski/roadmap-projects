#!/bin/bash 

get_cpu_usage(){
echo "=== CPU Usage ===" 
top -bn1 | grep "Cpu(s)" 
}

get_memory_usage(){
echo "=== Memory Usage ==="
free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3,$2,$3*100/$2 }' 
}

get_disk_usage(){
echo "=== Disk Usage ===" 
df -h --total | awk 'END {printf "Used: %s / Total: %s , (%.2f%%)", $3,$2 , $3 *100 / $2 }' 
}


get_top_cpu_proccesses(){
echo "=== Top 5 CPU Processes ===" 
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 
}

get_top_memory_processes(){
echo "=== Top 5 Memory Processes ==="
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
}

main(){
    get_cpu_usage
    get_memory_usage
    get_disk_usage
    get_top_cpu_proccesses
    get_top_memory_processes
}

main

