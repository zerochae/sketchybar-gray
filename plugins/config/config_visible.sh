#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_CONFIG_VISIBLE")
[ -z "$CURRENT" ] && CURRENT="false"

if [ "$CURRENT" = "true" ]; then
  NEW_VALUE="false"
else
  NEW_VALUE="true"
fi

set_config_value "SBAR_CONFIG_VISIBLE" "$NEW_VALUE"
sketchybar --reload
