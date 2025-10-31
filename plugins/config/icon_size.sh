#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_ICON_FONT_SIZE")

RESULT=$(osascript <<EOF
display dialog "Enter icon font size (e.g. 18.0):" default answer "$CURRENT" buttons {"Cancel", "OK"} default button "OK"
text returned of result
EOF
)

if [ $? -eq 0 ] && [ -n "$RESULT" ]; then
  set_config_value "SBAR_ICON_FONT_SIZE" "$RESULT"
  sketchybar --reload
fi
