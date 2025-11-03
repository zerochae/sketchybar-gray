#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

RAM_ICON=$(get_system_icon "ram")

sketchybar --add item ram.percent right \
  --set ram.percent \
  label.color="$COLOR_BLACK" \
  label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  update_freq="$SBAR_ITEM_UPDATE_FREQ_FAST" \
  script="$SBAR_PLUGIN_DIR/ram.sh" \
  \
--add item ram.icon right \
  --set ram.icon \
  icon="$RAM_ICON" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$SBAR_ICON_FONT_SIZE" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

add_bracket_item "ram" "$SBAR_COLOR_RAM" ram.percent ram.icon
