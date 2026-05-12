#!/bin/sh

# waybar module script that repeatedly checks the status of the Cato VPN
# and outputs a JSON object with the status to be consumed by waybar.
# Can be called with --toggle to toggle the VPN connection, or with --poll to start the polling loop.

TUN_INTERFACE="tun0"
OUTPUT_FILE="/tmp/cato_status.json"
LOCK_FILE="/tmp/cato_status.lock"

write_output() {
    # Wait for lock to be released
    while [ -f "$LOCK_FILE" ]; do
        sleep 0.1
    done
    echo "$1" > "$OUTPUT_FILE"
}

acquire_lock() {
    touch "$LOCK_FILE"
}

release_lock() {
    rm -f "$LOCK_FILE"
}

if [ "$1" = "--toggle" ]; then
        acquire_lock
        if cato-sdp status | grep -q "STATE_AUTHENTICATED"; then
                echo '{"text": "Disconnecting...", "alt": "disconnecting", "tooltip": "Disconnecting from Cato VPN", "class": "disconnecting"}' > "$OUTPUT_FILE"
                cato-sdp stop && echo '{"text": "Disconnected", "alt": "disconnected", "tooltip": "Cato is disconnected", "class": "disconnected"}' > "$OUTPUT_FILE"
        else
                echo '{"text": "Connecting...", "alt": "connecting", "tooltip": "Connecting to Cato VPN", "class": "connecting"}' > "$OUTPUT_FILE"
                cato-sdp start --use-systemd-resolv && echo '{"text": "Connected", "alt": "connected", "tooltip": "Cato is connected", "class": "connected"}' > "$OUTPUT_FILE"
        fi
        release_lock
        exit 0
fi


if [ "$1" = "--poll" ]; then
        rm -f "$OUTPUT_FILE"
        write_output '{"text": "Loading...", "alt": "loading", "tooltip": "Loading Cato status", "class": "loading"}'

        # Start background task to output the status file
    (
        while true; do
            cat "$OUTPUT_FILE" 2>/dev/null
            sleep 0.25
        done
    ) &
    OUTPUT_PID=$!

        trap "kill $OUTPUT_PID 2>/dev/null; exit 0" EXIT INT TERM HUP QUIT

        while true; do
                if ip link show "$TUN_INTERFACE" 2>/dev/null | grep -qE "state UP|state UNKNOWN"; then # if $TUN_INTERFACE is not found or is down, we consider it disconnected
                        write_output '{"text": "Connected", "alt": "connected", "tooltip": "Cato is connected", "class": "connected"}'
                else
                        write_output '{"text": "Disconnected", "alt": "disconnected", "tooltip": "Cato is disconnected", "class": "disconnected"}'
                fi
                sleep 0.5
        done
fi

echo '{"text": "Error", "alt": "error", "tooltip": "Invalid argument passed to cato.sh", "class": "error"}'
