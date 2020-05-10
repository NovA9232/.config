#!/bin/bash

# Configure displays
/home/josh/.config/scripts/displayPos.sh

# Restore background
nitrogen --restore

# Start compositor
picom --experimental-backends --backend glx

# Start bar updater

