#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"

LOADING_ICON=$(get_icon_from_json "fa-hourglass_half")

sketchybar --add item weather.label right \
  --set weather.label \
  label="$LOADING_ICON" \
  label.color="$COLOR_BLACK" \
  label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  update_freq=1800 \
  updates=on \
  script="SBAR_WEATHER_LOCATION=$SBAR_WEATHER_LOCATION $SBAR_PLUGIN_DIR/weather.sh" \
  \
  --add item weather.icon right \
  --set weather.icon \
  icon="" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$(echo "$SBAR_ICON_FONT_SIZE + 1.5" | bc)" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT" \
  \
  --add bracket weather weather.label weather.icon \
  --set weather \
  background.color="$SBAR_COLOR_WEATHER" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH"
