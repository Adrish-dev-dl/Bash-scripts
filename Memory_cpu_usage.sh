#!/bin/bash
filename="Mem_Cpu_$(date +%m-%y).txt"
if [ ! -f "/dev/Mem_Cpu_$(date +%m-%y).txt" ] ; then
	echo Date,Count of anonymous blocks,Memory Usage,Disk Uage,Active Anonymous Blocks,Inactive Anonymous Blocks,Total Memmory,Free Memory,Available Memory>>$filename
fi
date | awk -vORS=, '{print $1" "$2" "$3" "$4" "$5" "$6}'>>$filename
pmap $(eval ps -aux|pgrep java)|grep anon|wc -l|awk -vORS=, '{ print $1 }'>>$filename
free -m | awk 'NR==2{printf "%s/%sMB (%.2f%),", $3,$2,$3*100/$2}'>>$filename
iostat | awk 'NR==4{printf "%s%,",$1+$3}'>>$filename
df -h /dev | awk 'NR==2{printf "%s,",$5}'>>$filename
grep 'Active(anon)' /proc/meminfo | awk 'NR==1{printf "%s%s,", $2,$3}'>>$filename
grep 'Inactive(anon)' /proc/meminfo | awk 'NR==1{printf "%s%s,", $2,$3}'>>$filename
grep 'MemTotal' /proc/meminfo | awk 'NR==1{printf "%s%s,", $2,$3}'>>$filename
grep 'MemFree' /proc/meminfo | awk 'NR==1{printf "%s%s,", $2,$3}'>>$filename
grep 'MemAvailable' /proc/meminfo | awk 'NR==1{printf "%s%s\n", $2,$3}'>>$filename
exit
