#!/usr/bin/env bash

source "$CONFIG_DIR/tokens/colors.sh"
source "$CONFIG_DIR/plugins/app_icon.sh"

PID_FILE="/tmp/sketchybar_caffeinate.pid"

if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")
  if kill -0 "$PID" 2>/dev/null && ps -p "$PID" -o comm= | grep -q "caffeinate"; then
    ICON=$(get_system_icon "md-tea")
    ICON_COLOR="$COLOR_WHITE"
    BG_COLOR="$COLOR_GREEN"
  else
    rm "$PID_FILE"
    ICON=$(get_system_icon "md-coffee")
    ICON_COLOR="$COLOR_BLACK"
    BG_COLOR="$COLOR_GREEN_75"
  fi
else
  ICON=$(get_system_icon "md-coffee")
  ICON_COLOR="$COLOR_BLACK"
  BG_COLOR="$COLOR_GREEN_75"
fi

sketchybar --set caffeinate.icon \
  icon="$ICON" \
  icon.color="$ICON_COLOR" \
  \
--set caffeinate \
  background.color="$BG_COLOR"
