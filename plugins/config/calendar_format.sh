#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_CALENDAR_FORMAT")

RESULT=$(osascript <<EOF
set formats to {"YYYY-MM-DD", "YYYY-MM-DD (ddd)", "ddd, YYYY-MM-DD", "MM/DD", "MM/DD (ddd)", "ddd, MM/DD", "YYYY/MM/DD", "DD/MM/YYYY", "Custom..."}
set currentFormat to "$CURRENT"
set choice to choose from list formats with prompt "Select calendar format:" default items {currentFormat}
if choice is false then
  return ""
end if
set selectedFormat to item 1 of choice

if selectedFormat is "Custom..." then
  set customFormat to text returned of (display dialog "Enter custom calendar format:" default answer "$CURRENT")
  return customFormat
else
  return selectedFormat
end if
EOF
)

if [ -n "$RESULT" ]; then
  set_config_value "SBAR_CALENDAR_FORMAT" "$RESULT"
  sketchybar --reload
fi
