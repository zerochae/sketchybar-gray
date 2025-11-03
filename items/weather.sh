#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"

WEATHER_ICON=$(get_system_icon "weather")

sketchybar --add item weather.label right \
  --set weather.label \
  label.color="$COLOR_BLACK" \
  label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  update_freq=1800 \
  script="$SBAR_PLUGIN_DIR/weather.sh"

sketchybar --add item weather.icon right \
  --set weather.icon \
  icon="$WEATHER_ICON" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:23.0" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

sketchybar --add bracket weather weather.label weather.icon \
  --set weather \
  background.color="$SBAR_COLOR_WEATHER" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH"
