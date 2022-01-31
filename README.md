# Bash-scripts

Since linux servers are widely used in enterprise level system, we often need to monitor resource utilization in the servers. I have compiled a list of commands and filtered their output. 

Command list :- 

Date -> to see particular date of the system.


iostat -> to monitor CPU usage of the system.


free -m -> to see the free and consumed RAM memory of the system


df -h <drive name> -> to monitor free sapce in a mounted drive/filesystem


grep 'Active(anon)' /proc/meminfo | awk 'NR==1{printf "%s%s,", $2,$3}' -> Fetch active anonymous blocks from /proc/meminfo file


grep 'Inactive(anon)' /proc/meminfo | awk 'NR==1{printf "%s%s,", $2,$3}' -> Fetch inactive anonymous blocks from /proc/meminfo file


grep 'MemTotal' /proc/meminfo | awk 'NR==1{printf "%s%s,", $2,$3}'>> -> Fetch active anonymous blocks from /proc/meminfo file


grep 'MemFree' /proc/meminfo | awk 'NR==1{printf "%s%s,", $2,$3}'>> -> Memory not used by system 


grep 'MemAvailable' /proc/meminfo ->  MemAvailable is An estimate of how much memory is available for starting new applications, without swapping.


All the commands can be run individually to test the subsequent output. While running please exclude '>>$filename'. To run the script enter                      './Memory_cpu_usage.sh' .                 

