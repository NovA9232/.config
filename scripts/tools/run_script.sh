#!/bin/bash
# $1 is the script's relative location to the .config/scripts/ folder.
log_folder=$HOME/.config/scripts/logs/

if [ ! -d $log_folder ]; then	# if directory for logs doesn't exist, then make one.
	mkdir $log_folder
fi

if [ -e $HOME/.config/scripts/"$1" ]; then
	$($HOME/.config/scripts/"$1" > $log_folder/"$1")
else
	echo "run_script: Can't run script, doesn't exist."
fi
