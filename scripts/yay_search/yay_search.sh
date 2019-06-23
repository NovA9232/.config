#!/bin/bash
package=$(yay -Pc | cut -f1 | sort | rofi -dmenu -i -l 30 -p "Package:")
if [ ! $? -eq 1 ]; then
	install=$(echo -e "Yes\nSee Description\nNo" | rofi -dmenu -i -p "Install?")
	if [ ! $? -eq 1 ]; then
		if [ "$install" = "Yes" ]; then
			termite -e "./install_and_wait.sh $package"
		elif [ "$install" = "See Description" ]; then
			rofi -e "$(yay -Ss $package)"
		fi
	fi
fi
