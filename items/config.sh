#!/usr/bin/env bash

source "$CONFIG_DIR/core/env.sh"
source "$CONFIG_DIR/tokens/colors.sh"
source "$CONFIG_DIR/plugins/helpers.sh"
source "$CONFIG_DIR/plugins/icon.sh"

CONFIG_ICON=$(get_widget_icon "config")

if [ "$SBAR_CONFIG_VISIBLE" = "true" ]; then
  sketchybar --add item config.icon right \
    --set config.icon \
    icon="$CONFIG_ICON" \
    icon.color="$COLOR_BLACK" \
    icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
    icon.padding_right="$(calc "$SBAR_ITEM_LABEL_PADDING_RIGHT - 2")" \
    click_script="$SBAR_EVENT_DIR/open_settings.sh"
else
  sketchybar --add item config.icon right \
    --set config.icon \
    icon="$CONFIG_ICON" \
    icon.color=0x00000000 \
    icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
    icon.padding_right="$(calc "$SBAR_ITEM_LABEL_PADDING_RIGHT - 2")" \
    click_script="$SBAR_EVENT_DIR/open_settings.sh"
fi
