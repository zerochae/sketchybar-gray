#!/usr/bin/env bash

source "$CONFIG_DIR/tokens/colors.sh"
source "$CONFIG_DIR/plugins/app_icon.sh"

SBAR_APP_ICON_FONT="${SBAR_APP_ICON_FONT:-sketchybar-app-font}"
SBAR_APP_ICON_FONT_SIZE="${SBAR_APP_ICON_FONT_SIZE:-24.0}"

if [ -n "$INFO" ]; then
  APP_NAME="$INFO"
  ICON=$(get_icon "$APP_NAME")

  sketchybar --set front_app.icon icon="$ICON"
  sketchybar --set front_app.name label="$APP_NAME"
fi
