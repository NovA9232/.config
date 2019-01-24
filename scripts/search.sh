#!/bin/bash

browser=surf  # Set browser here
searchEng="https://duckduckgo.com/"
brQryFmt="?q=" # Set query formatting for search engine.
extraCmds=""  # Set any extra commands for all browsers here

if [ $browser = surf ]; then    # Set browser specific extras like this
	extraCmds="$extraCmds -z 1.2"
fi

searchT=$(dmenu -fn "DejaVuSansMono Nerd Font 12" -p "Search:")   # Open dmenu
if [ $? -eq 0 ]; then  # If dmenu ran fine.
	if [ -n "$searchT" ]; then
		lower="$(echo "${searchT:0:3}" | tr "[:upper:]" "[:lower:]")" # Change string to lower.
		if [ $lower = "yt:" ]; then
			IFS=":"; temp=( $searchT ); unset IFS;
			IFS=" "; searchArr=(${temp[1]}); unset IFS;       # Split string by spaces.
			searchString="$(IFS="+"; echo "${searchArr[*]}")"	  # Join the string back together with '+'
			$browser "https://www.youtube.co.uk/results?search_query=$searchString"   # I removed extraCmds here because I like youtube on 100% zoom.

		elif [ $lower = "yt" ]; then
			$browser "https://www.youtube.co.uk/"

		else
			IFS=" "; searchArr=($searchT); unset IFS;       # Split string by spaces.
			searchString="$(IFS="+"; echo "${searchArr[*]}")" # Join the string back together with '+'
			$browser $extraCmds $searchEng$brQryFmt$searchString	# Open browser with new search string.
		fi
	else
		$browser $extraCmds $searchEng
	fi

	if [ ! $? -eq 0 ]; then
		./tools/writeToLog.sh "surf exited with error code: $?"
	fi
else
	if [ ! $? -eq 1 ]; then # if the error was not 1 - which is the number dmenu gives when the escape key is pressed.
		./tools/writeToLog.sh "dmenu exited with error code: $?"
	fi
fi

# NOTE: If using duckduckgo, then you can input '\search' takes you to the first search result. This is useful for popular websites.
