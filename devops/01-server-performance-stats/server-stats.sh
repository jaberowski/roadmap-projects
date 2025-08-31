#!/bin/bash 


echo "=== CPU Usage ===" 
top -bn1 | grep "Cpu(s)" 

echo "=== Memory Usage ==="
free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3,$2,$3*100/$2 }' 

echo "=== Disk Usage ===" 
df -h --total | awk 'END {printf "Used: %s / Total: %s , (%.2f%%)", $3,$2 , $3 *100 / $2 }' 

echo "=== Top 5 CPU Processes ===" 
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 

echo "=== Top 5 Memory Processes ==="
ps -eo pid,comm,%mem --sort=-%mem | head -n 6