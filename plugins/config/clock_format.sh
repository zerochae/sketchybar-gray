#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_CLOCK_FORMAT")

RESULT=$(osascript <<EOF
set formats to {"MM/DD HH:mm", "HH:mm", "YYYY-MM-DD HH:mm:ss", "HH:mm:ss", "Custom..."}
set currentFormat to "$CURRENT"
set choice to choose from list formats with prompt "Select clock format:" default items {currentFormat}
if choice is false then
  return ""
end if
set selectedFormat to item 1 of choice

if selectedFormat is "Custom..." then
  set customFormat to text returned of (display dialog "Enter custom clock format:" default answer "$CURRENT")
  return customFormat
else
  return selectedFormat
end if
EOF
)

if [ -n "$RESULT" ]; then
  set_config_value "SBAR_CLOCK_FORMAT" "$RESULT"
  sketchybar --reload
fi
