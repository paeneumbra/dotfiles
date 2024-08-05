#!/bin/sh

FILETYPE=$(xdg-mime query filetype $1)
APP=$(fd -c always --search-path /usr/share -e .desktop --exec basename | rofi -theme base -dmenu -i -p "Default to")
xdg-mime default "$APP" "$FILETYPE"
echo "$APP set as default application to open $FILETYPE"
