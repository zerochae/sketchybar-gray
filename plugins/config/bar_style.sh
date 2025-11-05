#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_BAR_STYLE")

RESULT=$(osascript <<EOF
set styles to {"block", "compact"}
set currentStyle to "$CURRENT"
set choice to choose from list styles with prompt "Select bar style:" default items {currentStyle}
if choice is false then
  return ""
end if
return item 1 of choice
EOF
)

if [ -n "$RESULT" ]; then
  set_config_value "SBAR_BAR_STYLE" "$RESULT"
  sketchybar --reload
fi
