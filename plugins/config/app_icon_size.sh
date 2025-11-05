#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_APP_ICON_FONT_SIZE")

if RESULT=$(osascript <<EOF
display dialog "Enter app icon font size (e.g. 13.5):" default answer "$CURRENT" buttons {"Cancel", "OK"} default button "OK"
text returned of result
EOF
) && [ -n "$RESULT" ]; then
  set_config_value "SBAR_APP_ICON_FONT_SIZE" "$RESULT"
  sketchybar --reload
fi
