#!/bin/bash

if [ $(pactl get-source-mute $(pactl get-default-source 2>/dev/null) 2>/dev/null | cut -d' ' -f2) == 'yes' ]; then 
    echo ' '
    #echo ''
else
    echo ''
fi