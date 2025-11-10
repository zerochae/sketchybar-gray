#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

CAFFEINATE_ICON=$(get_widget_icon "coffee_on")

sketchybar --add item caffeinate.icon right \
  --set caffeinate.icon \
  icon="$CAFFEINATE_ICON" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$(calc "$SBAR_ICON_FONT_SIZE + 3")" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$(calc "$SBAR_ITEM_LABEL_PADDING_RIGHT - 2")" \
  script="$SBAR_PLUGIN_DIR/caffeinate.sh" \
  click_script="$SBAR_EVENT_DIR/caffeinate_toggle.sh" \
  --subscribe caffeinate.icon caffeinate_update
