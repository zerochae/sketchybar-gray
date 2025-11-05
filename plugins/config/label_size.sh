#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_LABEL_FONT_SIZE")

if RESULT=$(osascript <<EOF
display dialog "Enter label font size (e.g. 12.0):" default answer "$CURRENT" buttons {"Cancel", "OK"} default button "OK"
text returned of result
EOF
) && [ -n "$RESULT" ]; then
  set_config_value "SBAR_LABEL_FONT_SIZE" "$RESULT"
  sketchybar --reload
fi
