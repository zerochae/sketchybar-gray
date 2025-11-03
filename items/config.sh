#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"

CONFIG_ICON=$(get_system_icon "config")

sketchybar --add item config right \
  --set config \
  icon="$CONFIG_ICON" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT" \
  label.drawing=off \
  background.color="$COLOR_BLUE1" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width=0 \
  background.drawing=on \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
  popup.align=right \
  popup.height=30 \
  popup.padding_left="$SBAR_POPUP_PADDING_LEFT" \
  popup.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  popup.y_offset=8 \
  popup.background.color="$COLOR_BG2" \
  popup.background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  popup.background.border_width=1 \
  popup.background.border_color="$COLOR_DARK_GRAY" \
  popup.background.shadow.drawing=on \
  click_script="sketchybar --set config popup.drawing=toggle"

sketchybar --add item config.category_font popup.config \
  --set config.category_font \
  icon=󰛖 \
  label="FONT" \
  icon.drawing=off \
  label.color="$COLOR_WHITE" \
  label.font="$SBAR_LABEL_FONT_FACE_BOLD:12.0" \
  label.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  background.color="$COLOR_DARK_GRAY" \
  background.height=20 \
  background.corner_radius=4 \
  click_script=""

sketchybar --add item config.icon_font_family popup.config \
  --set config.icon_font_family \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Icon Font Family" \
  click_script="$SBAR_PLUGIN_DIR/config/icon_font_family.sh"

sketchybar --add item config.label_font_family popup.config \
  --set config.label_font_family \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Label Font Family" \
  click_script="$SBAR_PLUGIN_DIR/config/label_font_family.sh"

sketchybar --add item config.icon_size popup.config \
  --set config.icon_size \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Icon Size" \
  click_script="$SBAR_PLUGIN_DIR/config/icon_size.sh"

sketchybar --add item config.label_size popup.config \
  --set config.label_size \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Label Size" \
  click_script="$SBAR_PLUGIN_DIR/config/label_size.sh"

sketchybar --add item config.app_icon_size popup.config \
  --set config.app_icon_size \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="App Icon Size" \
  click_script="$SBAR_PLUGIN_DIR/config/app_icon_size.sh"

sketchybar --add item config.category_widget popup.config \
  --set config.category_widget \
  icon= \
  label="WIDGET" \
  icon.drawing=off \
  label.color="$COLOR_WHITE" \
  label.font="$SBAR_LABEL_FONT_FACE_BOLD:12.0" \
  label.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  background.color="$COLOR_DARK_GRAY" \
  background.height=20 \
  background.corner_radius=4 \
  click_script=""

sketchybar --add item config.clock_format popup.config \
  --set config.clock_format \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Clock Format" \
  click_script="$SBAR_PLUGIN_DIR/config/clock_format.sh"

sketchybar --add item config.weather_location popup.config \
  --set config.weather_location \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Weather Location" \
  click_script="$SBAR_PLUGIN_DIR/config/weather_location.sh"

sketchybar --add item config.netstat_graph popup.config \
  --set config.netstat_graph \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Netstat Graph" \
  click_script="$SBAR_PLUGIN_DIR/config/netstat_graph.sh"

sketchybar --add item config.netstat_speed popup.config \
  --set config.netstat_speed \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Netstat Speed" \
  click_script="$SBAR_PLUGIN_DIR/config/netstat_speed.sh"

sketchybar --add item config.separator3 popup.config \
  --set config.separator3 \
  icon= \
  label="────────────" \
  label.color="$COLOR_DARK_GRAY" \
  click_script=""

sketchybar --add item config.reload popup.config \
  --set config.reload \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Reload Config" \
  icon.color="$COLOR_GREEN1" \
  label.color="$COLOR_GREEN1" \
  click_script="sketchybar --reload"
