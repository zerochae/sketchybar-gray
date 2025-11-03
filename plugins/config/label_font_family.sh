#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_LABEL_FONT_FAMILY")

RESULT=$(osascript <<EOF
display dialog "Enter label font family name:" default answer "$CURRENT" buttons {"Cancel", "OK"} default button "OK"
text returned of result
EOF
)

if [ $? -eq 0 ] && [ -n "$RESULT" ]; then
  set_config_value "SBAR_LABEL_FONT_FAMILY" "$RESULT"
  sketchybar --reload
fi
