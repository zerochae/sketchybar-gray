#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo '[0-9]+%' | tr -d '%')"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ -z "$PERCENTAGE" ]; then
  exit 0
fi

if [ "$CHARGING" != "" ]; then
  ICON=$(get_widget_icon "fa-battery_4")
else
  if [ "$PERCENTAGE" -ge 75 ]; then
    ICON=$(get_widget_icon "fa-battery_4")
  elif [ "$PERCENTAGE" -ge 50 ]; then
    ICON=$(get_widget_icon "fa-battery_3")
  elif [ "$PERCENTAGE" -ge 25 ]; then
    ICON=$(get_widget_icon "fa-battery_2")
  else
    ICON=$(get_widget_icon "fa-battery_1")
  fi
fi

sketchybar --set battery.icon icon="$ICON"
sketchybar --set battery.percent label="${PERCENTAGE}%"
