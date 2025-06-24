#!/bin/bash

WALLPAPERS_DIR="$HOME/pictures/wallpapers/cat/surface0/"
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
echo $WALLPAPER
