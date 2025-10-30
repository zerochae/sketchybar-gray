#!/usr/bin/env bash

source "$CONFIG_DIR/tokens/colors.sh"
source "$CONFIG_DIR/plugins/app_icon.sh"

PID_FILE="/tmp/sketchybar_caffeinate.pid"

if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
  ICON=$(get_icon_from_json "md-tea")
  ICON_COLOR="$COLOR_WHITE"
  BG_COLOR="$COLOR_GREEN1"
else
  ICON=$(get_icon_from_json "md-coffee")
  ICON_COLOR="$COLOR_BLACK"
  BG_COLOR="$COLOR_GREEN2"
fi

sketchybar --set caffeinate.icon \
  icon="$ICON" \
  icon.color="$ICON_COLOR" \
  \
--set caffeinate \
  background.color="$BG_COLOR"
