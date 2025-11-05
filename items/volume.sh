#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

VOLUME_ICON=$(get_widget_icon "volume_mute")

sketchybar --add item volume.label right \
  --set volume.label \
  label.color="$COLOR_BLACK" \
  label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  update_freq=1 \
  script="$SBAR_PLUGIN_DIR/volume.sh" \
  --subscribe volume.label volume_change \
  \
--add item volume.icon right \
  --set volume.icon \
  icon="$VOLUME_ICON" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$(calc "$SBAR_ICON_FONT_SIZE + 4")" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"


sketchybar --set volume click_script="$SBAR_EVENT_DIR/volume_click.sh"
