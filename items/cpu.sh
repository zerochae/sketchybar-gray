#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

CPU_ICON=$(get_widget_icon "cpu")

BRACKET_ITEMS=()

if [ "$SBAR_CPU_SHOW_GRAPH" = true ]; then
  sketchybar --add graph cpu.graph right 42 \
    --set cpu.graph \
    graph.color="$COLOR_BLUE_75" \
    graph.fill_color="$COLOR_BLACK_25" \
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
    script="SBAR_CPU_SHOW_GRAPH=$SBAR_CPU_SHOW_GRAPH SBAR_CPU_SHOW_PERCENT=$SBAR_CPU_SHOW_PERCENT $SBAR_PLUGIN_DIR/cpu.sh" \
    width=42
  BRACKET_ITEMS+=("cpu.graph")
elif [ "$SBAR_CPU_SHOW_PERCENT" = true ]; then
  sketchybar --add item cpu.percent right \
    --set cpu.percent \
    label.color="$COLOR_BLACK" \
    label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
    label.padding_left=0 \
    update_freq="$SBAR_ITEM_UPDATE_FREQ_FAST" \
    script="SBAR_CPU_SHOW_GRAPH=$SBAR_CPU_SHOW_GRAPH SBAR_CPU_SHOW_PERCENT=$SBAR_CPU_SHOW_PERCENT $SBAR_PLUGIN_DIR/cpu.sh"
  BRACKET_ITEMS+=("cpu.percent")
fi

sketchybar --add item cpu.icon right \
  --set cpu.icon \
  icon="$CPU_ICON" \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$(calc "$SBAR_ICON_FONT_SIZE + 4")" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

BRACKET_ITEMS+=("cpu.icon")

