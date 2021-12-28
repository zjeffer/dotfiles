#!/bin/bash

if [ $(pactl get-source-mute $(pactl get-default-source) | cut -d' ' -f2) == 'yes' ]; then 
    echo ' '
    #echo ''
else
    echo ''
fi