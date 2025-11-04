#!/usr/bin/env bash

# Sketchybar environment variables
: "${INFO:=}"

source "$CONFIG_DIR/tokens/colors.sh"
source "$CONFIG_DIR/plugins/icon.sh"

if [ -n "$INFO" ]; then
  APP_NAME="$INFO"
  ICON=$(get_app_icon "$APP_NAME")

  sketchybar --set front_app.icon icon="$ICON"
  sketchybar --set front_app.name label="$APP_NAME"
fi
