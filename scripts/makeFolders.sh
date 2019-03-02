#!/bin/bash

makeFol() {
	for i in $( seq 0 $2 ); do
		if [ ! -d "fold$i" ]; then
			mkdir "fold$i"
			cd "fold$i"
			if [ $3 -lt $1 ]; then
				makeFol $1 $2 $(($3+1))
			else
				touch "egg"
			fi
			cd ..
		fi
	done
}

if [ -d "$1" ]; then
	rm -r "$1"
fi

mkdir "$1"
cd "$1"

makeFol $2 $3 0   # First num is the maximum depth, second is total num of folders to make per folder, third is the current depth count (since recursive)
