#!/bin/bash

# Script to switch between audio outputs for waybar
# Executing the script will select the next audio output as default sink

logger() {
  echo -e "[switch_audio_output] $1"
}

# Get all outputs
outputs=$(pactl list sinks short | awk '{print $2}')

if [[ -z $outputs ]]; then
  logger "No outputs found: cannot switch to new output"
  exit 1
fi

if [[ $(echo $outputs | wc -w) -eq 1 ]]; then
  logger "Only one output found: cannot switch to new output"
  exit 1
fi

# Get current audio output
current_output=$(pactl info | grep "Default Sink" | awk '{print $3}')

if [[ -z $current_output ]]; then
  logger "No current output found"
  exit 1
fi

# Get next audio output
for i in $outputs; do
  if [[ $found_match == true ]]; then
    next_output=$i
    break
  fi
  if [[ $i == $current_output ]]; then
    found_match=true
  fi
done

if [[ -z $next_output ]]; then
  next_output=$(echo $outputs | awk '{print $1}')
fi

if [[ -z $next_output ]]; then
  logger "No next output found"
  exit 1
fi

# switch
logger "Switching from $current_output to $next_output"
pactl set-default-sink $next_output
