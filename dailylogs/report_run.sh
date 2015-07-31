#!/bin/bash

today=$(date +"%d-%m-%Y")
time=$(date +"%H:%M:%S")

printf -v d "Current User:\t%s\nDate:\t\t%s @ %s\n" $USER $today $time
echo "$d"

freespace=$(df -h / | grep -E "\/$" | awk '{print $4}')
greentext="\033[32m"
normal="\033[0m"
logdate=$(date +"%Y%m%d")
logfile="$logdate"_report.log

echo -e $greentext"This system report is for" "$HOSTNAME"$normal
printf "\tSystem type:\t%s\n" $MACHTYPE
printf "\tFree Space:\t%s\n" $freespace
printf "\tFiles in dir:\t%s\n" $(ls | wc -l)
printf "\tGenerated on:\t%s\n" $(date +"%m/%d/%y") 
echo -e $greentext"A summary of this info has been saved to $logfile"$normal


cat <<- EOF > $logfile
	This report contains a brief summary of system information.
EOF

printf "SYS:\t%s\n" $MACHTYPE >> $logfile
printf "BASH:\t%s\n" $BASH_VERSION >> $logfile 

