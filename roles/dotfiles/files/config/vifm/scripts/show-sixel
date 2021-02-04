#!/usr/bin/env bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 filename width height"
    exit 1
fi

dim=( $(exiftool -m -p '$ImageWidth $ImageHeight' "$1") )

pw=$(($2*11))
ph=$(($3*25))

w=${dim[0]}
h=${dim[1]}

height=auto
width=auto

if [ $pw -lt $w ] && [ $ph -lt $h ]; then
    newh=$(echo "($h*$pw)/$w" | bc)
    neww=$(echo "($w*$ph)/$h" | bc)

    if [ $newh -le $ph ]; then
        width=$pw
    else
        height=$ph
    fi
elif [ $pw -lt $w ]; then
    width=$pw
elif [ $ph -lt $h ]; then
    height=$ph
fi

# debugging stuff
# echo pw=$pw ph=$ph
# echo w=$w h=$h
# echo neww=$neww newh=$newh
# echo width=$width height=$height

# account for GNU screen
if [ -n "$STY" ]; then
    popt=-P
fi

exec img2sixel -I $popt --width=$width --height=$height "$1"
