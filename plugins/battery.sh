#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo '[0-9]+%' | tr -d '%')"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ -z "$PERCENTAGE" ]; then
  exit 0
fi

if [ "$CHARGING" != "" ]; then
  ICON=$(get_system_icon "battery_charging")
else
  ICON=$(get_system_icon "battery" "$PERCENTAGE")
fi

sketchybar --set battery.icon icon="$ICON"
sketchybar --set battery.percent label="${PERCENTAGE}%"
