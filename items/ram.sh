#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

RAM_ICON=$(get_widget_icon "memory")

BRACKET_ITEMS=()

if [ "$SBAR_RAM_SHOW_GRAPH" = true ]; then
  sketchybar --add graph ram.graph right 42 \
    --set ram.graph \
    graph.color="$COLOR_RED" \
    graph.fill_color="$COLOR_MAGENTA_75" \
    background.height=22 \
    background.color=0x00000000 \
    background.border_color=0x00000000 \
    background.drawing=on \
    label.color="$COLOR_BLACK" \
    label.font="$SBAR_LABEL_FONT_FACE_REGULAR:8.5" \
    label.padding_right=0 \
    label.y_offset=6 \
    label.padding_left=-20 \
    update_freq="$SBAR_ITEM_UPDATE_FREQ_FAST" \
    script="SBAR_RAM_SHOW_GRAPH=$SBAR_RAM_SHOW_GRAPH SBAR_RAM_SHOW_PERCENT=$SBAR_RAM_SHOW_PERCENT $SBAR_PLUGIN_DIR/ram.sh" \
    width=42
  BRACKET_ITEMS+=("ram.graph")
elif [ "$SBAR_RAM_SHOW_PERCENT" = true ]; then
  sketchybar --add item ram.percent right \
    --set ram.percent \
    label.color="$COLOR_BLACK" \
    label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
    label.padding_left=0 \
    update_freq="$SBAR_ITEM_UPDATE_FREQ_FAST" \
    script="SBAR_RAM_SHOW_GRAPH=$SBAR_RAM_SHOW_GRAPH SBAR_RAM_SHOW_PERCENT=$SBAR_RAM_SHOW_PERCENT $SBAR_PLUGIN_DIR/ram.sh"
  BRACKET_ITEMS+=("ram.percent")
fi

sketchybar --add item ram.icon right \
  --set ram.icon \
  icon="$RAM_ICON" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$(calc "$SBAR_ICON_FONT_SIZE + 4")" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

BRACKET_ITEMS+=("ram.icon")

