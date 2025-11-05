#!/usr/bin/env bash

source "$CONFIG_DIR/core/env.sh"
source "$CONFIG_DIR/tokens/colors.sh"
source "$CONFIG_DIR/plugins/icon.sh"

PID_FILE="/tmp/sketchybar_caffeinate.pid"

if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")
  if kill -0 "$PID" 2>/dev/null; then
    kill "$PID"
    rm "$PID_FILE"
    ICON=$(get_widget_icon "coffee_on")
    if [ "$SBAR_BAR_STYLE" = "compact" ]; then
      ICON_COLOR="$SBAR_COLOR_CAFFEINATE"
    else
      ICON_COLOR="$COLOR_BLACK"
      BG_COLOR="$COLOR_GREEN_75"
    fi
  else
    rm "$PID_FILE"
    caffeinate -d &
    echo $! >"$PID_FILE"
    ICON=$(get_widget_icon "coffee_off")
    if [ "$SBAR_BAR_STYLE" = "compact" ]; then
      ICON_COLOR="$SBAR_COLOR_CAFFEINATE_ON"
    else
      ICON_COLOR="$COLOR_WHITE"
      BG_COLOR="$COLOR_RED_75"
    fi
  fi
else
  caffeinate -d &
  echo $! >"$PID_FILE"
  ICON=$(get_widget_icon "coffee_off")
  if [ "$SBAR_BAR_STYLE" = "compact" ]; then
    ICON_COLOR="$SBAR_COLOR_CAFFEINATE_ON"
  else
    ICON_COLOR="$COLOR_WHITE"
    BG_COLOR="$COLOR_RED_75"
  fi
fi

if [ "$SBAR_BAR_STYLE" = "compact" ]; then
  sketchybar --set caffeinate.icon icon="$ICON" icon.color="$ICON_COLOR"
else
  sketchybar --set caffeinate.icon icon="$ICON" icon.color="$ICON_COLOR" \
    --set caffeinate background.color="$BG_COLOR"
fi
