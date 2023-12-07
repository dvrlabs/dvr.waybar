#!/bin/bash

current_sink=$(pactl info | grep "Default Sink" | cut -d" " -f3)

sink_names=( $(pactl list short sinks | awk '{print $2}') )

# Initialize HEADPHONES and SPEAKER variables
HEADPHONES=""
SPEAKER=""

# Assign sinks to HEADPHONES and SPEAKER based on 'usb' substring
for sink in "${sink_names[@]}"; do
    if [[ $sink == *"usb"* ]]; then
        HEADPHONES=$sink
    else
        SPEAKER=$sink
    fi
done

# Check if current sink is HEADPHONES or SPEAKER and echo symbol
if [[ "${current_sink}" = "${HEADPHONES}" ]]; then
    echo "🎧"
elif [[ "${current_sink}" = "${SPEAKER}" ]]; then
    echo "🔊"
else
    echo "?"
fi
