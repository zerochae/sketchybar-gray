#!/usr/bin/env bash

sketchybar --add item front_app.icon center \
  --set front_app.icon \
  icon="" \
  icon.font="$SBAR_FONT_FACE_BOLD:$SBAR_ICON_FONT_SIZE" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

sketchybar --add item front_app.name center \
  --set front_app.name \
  label.color="$COLOR_BLACK" \
  label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  script="$SBAR_PLUGIN_DIR/front_app.sh" \
  --subscribe front_app.name front_app_switched

sketchybar --add bracket front_app front_app.icon front_app.name \
  --set front_app \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.color="$SBAR_COLOR_FRONT_APP"
