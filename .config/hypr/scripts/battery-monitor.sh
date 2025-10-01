#!/bin/bash

BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

# Create lock files to prevent spam
LOCK_DIR="/tmp/battery_notifications"
mkdir -p $LOCK_DIR

if [[ $BATTERY_STATUS == "Discharging" ]]; then
    if [[ $BATTERY_LEVEL -le 10 && ! -f "$LOCK_DIR/critical" ]]; then
        notify-send -u critical "󰂎 Battery Critical!" "Only ${BATTERY_LEVEL}% remaining!"
        touch "$LOCK_DIR/critical"
        rm -f "$LOCK_DIR/low" "$LOCK_DIR/full"
    elif [[ $BATTERY_LEVEL -le 20 && ! -f "$LOCK_DIR/low" ]]; then
        notify-send -u normal "󱊡 Battery Low" "Battery at ${BATTERY_LEVEL}%"
        touch "$LOCK_DIR/low"
        rm -f "$LOCK_DIR/full"
    fi
elif [[ $BATTERY_STATUS == "Full" && ! -f "$LOCK_DIR/full" ]]; then
    notify-send -u low "󰁹 Battery Full" "Battery is fully charged!"
    touch "$LOCK_DIR/full"
    rm -f "$LOCK_DIR/low" "$LOCK_DIR/critical"
fi

# Clean up old locks when charging
if [[ $BATTERY_STATUS == "Charging" && $BATTERY_LEVEL -gt 25 ]]; then
    rm -f "$LOCK_DIR/low" "$LOCK_DIR/critical"
fi
