#!/bin/bash


#-----------{draw bar}-------------------------
        draw_bar() {
                local percent=$1
                local width=40
                local filled=$((percent * width / 100))
                local empty=$((width - filled))

                printf "["
                printf "%${filled}s" | tr ' ' 'X'
                printf "%${empty}s" | tr ' ' '.'
                printf "] %3d%%" "$percent"
        }

#=================={ While loop }===========================

while true; do

	cpu_var=80
	mem_var=80
	disk_var=80

#=============={ time }==================

	time=$(date)

#=============={{ cpu }}=================
	idle=$(top -bn1 | grep "Cpu" | cut -f 4 -d "," | cut -f 2 -d " " | cut -f 1 -d ".")
	cpu=$((100 - $idle))

#=============={{ memory }}=================
	usage=$(free | grep "Mem" | awk '{print $3}')
	total=$(free | grep "Mem" | awk '{print $2}')

	memory=$(($usage * 100 / $total))

#=============={{ disk }}=================
	disk=$(df --output=pcent / | tail -n 1 | tr -d ' %')

#=============={{ Old Display }}=================
	echo -e "\n==========================================================="
	echo "|                   System Monitoring Tool                |"
	echo "==========================================================="
	echo "| update time : $time                                     "
#	echo -e "System real time CPU usage : $cpu%\n"
#	echo -e "system real time MEMORY usage : $memory%\n"
#	echo -e "System real time DISK usage : $disk%\n"
#	echo -e "===========================================================\n"

#=================={ New Display }=================

	echo -n "| Real time CPU usage     : "; draw_bar $cpu; echo
	echo -n "| Real time MEMORY usage  : "; draw_bar $memory; echo
	echo -n "| Real time DISK usage    : "; draw_bar $disk; echo 
	echo -e "===========================================================\n"


#----------------if-loop----------
	echo  "=============================================================="
        echo  "|                        ⚠️  ALERTS ⚠️                          |"
	echo -e "==============================================================\n"

	if [ $cpu -gt $cpu_var ]; then
		echo -e "---> ⚠️  ALERT: CPU at ${cpu}% (threshold : ${cpu_var}%)\n"
	fi

	if [ $memory -gt $mem_var ]; then
		echo -e "---> ⚠️ ALERT: MEMORY at ${memory}% (threshold : ${mem_var}%)\n"
	fi

	if [ $disk -gt $disk_var ]; then
		echo -e "---> ⚠️  ALERT: DISK at ${disk}% (threshold : ${disk_var}%)\n"
	fi

	sleep 3
done 
