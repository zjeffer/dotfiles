#!/bin/bash

# Script to switch between audio outputs for waybar
# Executing the script will select the next audio output as default sink

logger() {
  echo -e "[switch_audio_output] $1"
}

# Get all outputs
sinks=$(wpctl list audio sinks)
outputs=$(awk '!seen[$2]++ {print $1 "|" $2}' <<< "$sinks")

if [[ -z $outputs ]]; then
  logger "No outputs found: cannot switch to new output"
  exit 1
fi

if [[ $(wc -l <<< "$outputs") -eq 1 ]]; then
  logger "Only one output found: cannot switch to new output"
  exit 1
fi

# Get current audio output
current_output=$(awk '$NF == "*" {print $2; exit}' <<< "$sinks")

if [[ -z $current_output ]]; then
  logger "No current output found"
  exit 1
fi

# Get next audio output
while IFS='|' read -r output_id output_name; do
  echo "Checking output: $output_name"
  if [[ $found_match == true ]]; then
    next_output=$output_name
    next_output_id=$output_id
    break
  fi
  if [[ $output_name == "$current_output" ]]; then
    found_match=true
  fi
done <<< "$outputs"

if [[ -z $next_output ]]; then
  echo "Current output is the last one in the list, switching to first output"
  first_output=${outputs%%$'\n'*}
  next_output_id=${first_output%%|*}
  next_output=${first_output#*|}
fi

if [[ -z $next_output ]]; then
  logger "No next output found"
  exit 1
fi

# switch
logger "Switching from $current_output to $next_output"
wpctl set-default "$next_output_id"
