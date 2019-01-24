#!/bin/bash

searchT=$(dmenu -fn "DejaVuSansMono Nerd Font 12" -p "Search:")   # Open dmenu
if [ $? -eq 0 ]; then  # If dmenu ran fine.
	IFS=" "; searchArr=($searchT); unset IFS;       # Split string by spaces.
	searchString=$(IFS="+"; echo "${searchArr[*]}") # Join the string back together with '+'
	if [ -n "$searchString" ]; then
		surf -z 1.5 "https://duckduckgo.com/?q=$searchString"	# Return the new search string.
	else
		surf -z 1.5 "https://duckduckgo.com/"
	fi
	if [ ! $? -eq 0 ]; then
		./tools/writeToLog.sh "surf exited with error code: $?"
	fi
else
	if [ ! $? -eq 1 ]; then # if the error was not 1 - which is the number dmenu gives when the escape key is pressed.
		./tools/writeToLog.sh "dmenu exited with error code: $?"
	fi
fi
