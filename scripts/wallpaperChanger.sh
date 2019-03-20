#!/bin/bash

killall -q "killall -q /bin/bash /home/josh/.config/scripts/wallpaperChanger"

while :
do
	nitrogen --set-scaled --random
	sleep $1
done
