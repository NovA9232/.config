if [ ! -d ~/.config/scripts/logs/ ]; then	# if directory for logs doesn't exist, then make one.
	mkdir ~/.config/scripts/logs/
fi
echo $1 > ~/.config/scripts/logs/search.log

