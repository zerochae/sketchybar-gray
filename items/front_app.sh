#!/usr/bin/env bash

sketchybar --add item front_app.icon center \
  --set front_app.icon \
  icon="" \
  icon.font="$SBAR_APP_ICON_FONT:Regular:$SBAR_APP_ICON_FONT_SIZE" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

sketchybar --add item front_app.name center \
  --set front_app.name \
  label.color="$COLOR_BLACK" \
  label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  script="$SBAR_PLUGIN_DIR/front_app.sh" \
  --subscribe front_app.name front_app_switched yabai_window_focus

