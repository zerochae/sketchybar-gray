#!/usr/bin/env bash

source "$CONFIG_DIR/tokens/colors.sh"
source "$CONFIG_DIR/plugins/app_icon.sh"

PID_FILE="/tmp/sketchybar_caffeinate.pid"

if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")
  if kill -0 "$PID" 2>/dev/null; then
    kill "$PID"
    rm "$PID_FILE"
    ICON=$(get_icon_from_json "md-coffee")
    ICON_COLOR="$COLOR_BLACK"
    BG_COLOR="$COLOR_GREEN2"
  else
    rm "$PID_FILE"
    caffeinate -d &
    echo $! >"$PID_FILE"
    ICON=$(get_icon_from_json "md-tea")
    ICON_COLOR="$COLOR_WHITE"
    BG_COLOR="$COLOR_RED2"
  fi
else
  caffeinate -d &
  echo $! >"$PID_FILE"
  ICON=$(get_icon_from_json "md-tea")
  ICON_COLOR="$COLOR_WHITE"
  BG_COLOR="$COLOR_RED2"
fi

sketchybar --set caffeinate.icon icon="$ICON" icon.color="$ICON_COLOR" \
  --set caffeinate background.color="$BG_COLOR"
