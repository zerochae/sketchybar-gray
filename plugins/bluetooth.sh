#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"
source "$CONFIG_DIR/core/env.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

BT_STATE=$(system_profiler SPBluetoothDataType 2>/dev/null | grep "State:" | awk '{print $2}')

if [ "$BT_STATE" = "On" ]; then
  ICON=$(get_widget_icon "bluetooth")
  COLOR="$SBAR_COLOR_BLUETOOTH"
  ICON_FONT_SIZE="$(calc "$SBAR_ICON_FONT_SIZE - 3")"
else
  ICON=$(get_widget_icon "bluetooth_off")
  COLOR="$COLOR_RED"
  ICON_FONT_SIZE=$SBAR_ICON_FONT_SIZE
fi

sketchybar --set bluetooth.icon icon="$ICON" icon.color="$COLOR" icon.font="$SBAR_ICON_FONT_FACE_BOLD:$ICON_FONT_SIZE"
