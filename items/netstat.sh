#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

DOWN_ICON=$(get_system_icon "network_down")
UP_ICON=$(get_system_icon "network_up")

sketchybar --add item netstat.down.label right \
  --set netstat.down.label \
  label.color="$COLOR_BLACK" \
  label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  update_freq="$SBAR_ITEM_UPDATE_FREQ_FAST" \
  script="SBAR_NETSTAT_SHOW_SPEED=$SBAR_NETSTAT_SHOW_SPEED SBAR_NETSTAT_SHOW_GRAPH=$SBAR_NETSTAT_SHOW_GRAPH $SBAR_PLUGIN_DIR/netstat.sh" \
  \
--add item netstat.down.icon right \
  --set netstat.down.icon \
  icon="$DOWN_ICON" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$SBAR_ICON_FONT_SIZE" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT" \
  \
--add item netstat.up.label right \
  --set netstat.up.label \
  label.color="$COLOR_BLACK" \
  label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  \
--add item netstat.up.icon right \
  --set netstat.up.icon \
  icon="$UP_ICON" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$SBAR_ICON_FONT_SIZE" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

add_bracket_item "netstat" "$SBAR_COLOR_NETSTAT" \
  netstat.down.label netstat.down.icon netstat.up.label netstat.up.icon
