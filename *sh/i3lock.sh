#! /bin/bash

scrot /tmp/screen.png

convert /tmp/screen.png -scale 10% -blur 0x1 -resize 1000% /tmp/screen.png

i3lock -i /tmp/screen.png
rm /tmp/screen.png
