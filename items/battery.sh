#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/helpers.sh"

sketchybar --add item battery.percent right \
  --set battery.percent \
  label.color="$COLOR_BLACK" \
  label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  update_freq="$SBAR_ITEM_UPDATE_FREQ_FAST" \
  script="$SBAR_PLUGIN_DIR/battery.sh" \
  --subscribe battery.percent system_woke power_source_change \
  \
  --add item battery.icon right \
  --set battery.icon \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$(calc "$SBAR_ICON_FONT_SIZE + 4")" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

battery.percent battery.icon
