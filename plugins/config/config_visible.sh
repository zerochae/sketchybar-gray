#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_CONFIG_VISIBLE")
[ -z "$CURRENT" ] && CURRENT="false"

RESULT=$(osascript <<EOF
set currentValue to "$CURRENT"
set options to {"true", "false"}
set choice to choose from list options with prompt "Show config item?" default items {currentValue}
if choice is false then
  return ""
end if
return item 1 of choice
EOF
)

if [ -n "$RESULT" ]; then
  set_config_value "SBAR_CONFIG_VISIBLE" "$RESULT"
  sketchybar --reload
fi
