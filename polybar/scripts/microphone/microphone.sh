#!/bin/bash

if [ $(pulseaudio-ctl full-status | cut -d ' ' -f3) == 'yes' ]; then 
    echo '  '
    #echo ''
else
    echo ''
fi