#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

DOWN_ICON=$(get_widget_icon "network_upload")
UP_ICON=$(get_widget_icon "network_download")

BRACKET_ITEMS=()

if [ "$SBAR_NETSTAT_SHOW_GRAPH" = true ]; then
  sketchybar --add graph netstat.down.graph right 42 \
    --set netstat.down.graph \
    graph.color="$COLOR_BLACK_25" \
    graph.fill_color="$COLOR_BLACK_25" \
    background.height=50 \
    background.color=0x00000000 \
    background.border_color=0x00000000 \
    background.drawing=on \
    label.color="$COLOR_BLACK" \
    label.font="$SBAR_LABEL_FONT_FACE_REGULAR:8.5" \
    label.padding_right=0 \
    label.y_offset=6 \
    label.padding_left=-24 \
    update_freq="$SBAR_ITEM_UPDATE_FREQ_FAST" \
    script="SBAR_NETSTAT_SHOW_SPEED=$SBAR_NETSTAT_SHOW_SPEED SBAR_NETSTAT_SHOW_GRAPH=$SBAR_NETSTAT_SHOW_GRAPH $SBAR_PLUGIN_DIR/netstat.sh" \
    width=42
  BRACKET_ITEMS+=("netstat.down.graph")
elif [ "$SBAR_NETSTAT_SHOW_SPEED" = true ]; then
  sketchybar --add item netstat.down.label right \
    --set netstat.down.label \
    label.color="$COLOR_BLACK" \
    label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
    label.padding_left=0 \
    update_freq="$SBAR_ITEM_UPDATE_FREQ_FAST" \
    script="SBAR_NETSTAT_SHOW_SPEED=$SBAR_NETSTAT_SHOW_SPEED SBAR_NETSTAT_SHOW_GRAPH=$SBAR_NETSTAT_SHOW_GRAPH $SBAR_PLUGIN_DIR/netstat.sh"
  BRACKET_ITEMS+=("netstat.down.label")
fi

sketchybar --add item netstat.down.icon right \
  --set netstat.down.icon \
  icon="$DOWN_ICON" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$SBAR_ICON_FONT_SIZE" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

BRACKET_ITEMS+=("netstat.down.icon")

if [ "$SBAR_NETSTAT_SHOW_GRAPH" = true ]; then
  sketchybar --add graph netstat.up.graph right 42 \
    --set netstat.up.graph \
    graph.color="$COLOR_BLACK_25" \
    graph.fill_color="$COLOR_BLACK_25" \
    background.height=50 \
    background.color=0x00000000 \
    background.border_color=0x00000000 \
    background.drawing=on \
    label.color="$COLOR_BLACK" \
    label.font="$SBAR_LABEL_FONT_FACE_REGULAR:8.5" \
    label.padding_right=0 \
    label.y_offset=6 \
    label.padding_left=-24 \
    width=42
  BRACKET_ITEMS+=("netstat.up.graph")
elif [ "$SBAR_NETSTAT_SHOW_SPEED" = true ]; then
  sketchybar --add item netstat.up.label right \
    --set netstat.up.label \
    label.color="$COLOR_BLACK" \
    label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
    label.padding_left=0
  BRACKET_ITEMS+=("netstat.up.label")
fi

sketchybar --add item netstat.up.icon right \
  --set netstat.up.icon \
  icon="$UP_ICON" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$SBAR_ICON_FONT_SIZE" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

BRACKET_ITEMS+=("netstat.up.icon")

