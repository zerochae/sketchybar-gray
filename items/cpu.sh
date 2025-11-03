#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

CPU_ICON=$(get_system_icon "cpu")

sketchybar --add item cpu.percent right \
  --set cpu.percent \
  label.color="$COLOR_BLACK" \
  label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  update_freq="$SBAR_ITEM_UPDATE_FREQ_FAST" \
  script="$SBAR_PLUGIN_DIR/cpu.sh" \
  \
--add item cpu.icon right \
  --set cpu.icon \
  icon="$CPU_ICON" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$SBAR_ICON_FONT_SIZE" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

add_bracket_item "cpu" "$SBAR_COLOR_CPU" cpu.percent cpu.icon
