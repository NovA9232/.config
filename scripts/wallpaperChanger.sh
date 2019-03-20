#!/bin/bash

killall -q "./wallpaperChanger"

while :
do
	nitrogen --set-scaled --random
	sleep $1
done
