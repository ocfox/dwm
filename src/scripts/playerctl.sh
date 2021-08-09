#!/bin/sh
options="play\npause\nnext\nprevious\n"

selection="$(echo -e $options | \
             dmenu -i -p "Do something")"

result=$(playerctl $selection)
./dwm-status-refresh
