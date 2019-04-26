#!/bin/bash
if [ $(echo -e "No\nYes" | dmenu -i -p "Shutdown?" -fn "DejaVuSansMono Nerd Font 12") == "Yes" ]; then
	shutdown -h now
fi
