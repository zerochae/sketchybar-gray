#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

CAFFEINATE_ICON=$(get_icon_from_json "md-coffee")

sketchybar --add item caffeinate.icon right \
  --set caffeinate.icon \
  icon="$CAFFEINATE_ICON" \
  icon.font="$SBAR_FONT_FACE_BOLD:$SBAR_ICON_FONT_SIZE" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  script="$SBAR_PLUGIN_DIR/caffeinate.sh" \
  click_script="$SBAR_PLUGIN_DIR/caffeinate_toggle.sh" \
  --subscribe caffeinate.icon caffeinate_update

add_bracket_item "caffeinate" "$SBAR_COLOR_CAFFEINATE" caffeinate.icon
