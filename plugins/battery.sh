#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo '[0-9]+%' | tr -d '%')"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ -z "$PERCENTAGE" ]; then
  exit 0
fi

if [ "$CHARGING" != "" ]; then
  ICON=$(get_widget_icon "battery_full")
else
  if [ "$PERCENTAGE" -ge 75 ]; then
    ICON=$(get_widget_icon "battery_full")
  elif [ "$PERCENTAGE" -ge 50 ]; then
    ICON=$(get_widget_icon "battery_medium")
  elif [ "$PERCENTAGE" -ge 25 ]; then
    ICON=$(get_widget_icon "battery_low")
  else
    ICON=$(get_widget_icon "battery_empty")
  fi
fi

sketchybar --set battery.icon icon="$ICON"
sketchybar --set battery.percent label="${PERCENTAGE}%"
