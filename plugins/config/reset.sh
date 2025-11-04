#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

RESULT=$(osascript <<EOF
set dialogResult to display dialog "Reset all custom settings to default?" buttons {"Cancel", "Reset"} default button "Cancel" with icon caution
if button returned of dialogResult is "Reset" then
  return "yes"
else
  return "no"
end if
EOF
)

if [ "$RESULT" = "yes" ]; then
  if [ -f "$USER_CONFIG" ]; then
    rm "$USER_CONFIG"
  fi
  sketchybar --reload
fi
