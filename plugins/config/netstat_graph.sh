#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_NETSTAT_SHOW_GRAPH")

RESULT=$(osascript <<EOF
set currentValue to "$CURRENT"
set options to {"true", "false"}
set choice to choose from list options with prompt "Show netstat graph?" default items {currentValue}
if choice is false then
  return ""
end if
return item 1 of choice
EOF
)

if [ -n "$RESULT" ]; then
  set_config_value "SBAR_NETSTAT_SHOW_GRAPH" "$RESULT" false
  sketchybar --reload
fi
