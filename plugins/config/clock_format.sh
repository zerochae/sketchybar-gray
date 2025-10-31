#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_CLOCK_FORMAT")

RESULT=$(osascript <<EOF
set formats to {"MM/DD HH:mm", "HH:mm", "yyyy-MM-DD HH:mm:ss", "HH:mm:ss"}
set currentFormat to "$CURRENT"
set choice to choose from list formats with prompt "Select clock format or enter custom:" default items {currentFormat}
if choice is false then
  return ""
end if
return item 1 of choice
EOF
)

if [ -n "$RESULT" ]; then
  set_config_value "SBAR_CLOCK_FORMAT" "$RESULT"
  sketchybar --reload
fi
