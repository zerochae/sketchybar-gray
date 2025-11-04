#!/usr/bin/env bash

source "$CONFIG_DIR/tokens/colors.sh"
source "$CONFIG_DIR/plugins/app_icon.sh"

CONFIG_ICON=$(get_system_icon "config")

CONFIG_VISIBLE="${SBAR_CONFIG_VISIBLE:-true}"
if [ "$CONFIG_VISIBLE" = "false" ]; then
  CONFIG_ICON_COLOR="$COLOR_TRANSPARENT"
  CONFIG_BG_DRAWING="off"
else
  CONFIG_ICON_COLOR="$COLOR_BLACK"
  CONFIG_BG_DRAWING="on"
fi

sketchybar --add item config right \
  --set config \
  icon="$CONFIG_ICON" \
  icon.color="$CONFIG_ICON_COLOR" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right=6 \
  label.drawing=off \
  background.color="$COLOR_BLUE" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width=0 \
  background.drawing="$CONFIG_BG_DRAWING" \
  popup.align=right \
  popup.height=30 \
  popup.padding_left="$SBAR_POPUP_PADDING_LEFT" \
  popup.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  popup.y_offset=2 \
  popup.background.color="$COLOR_BG1" \
  popup.background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  popup.background.border_width=1 \
  popup.background.border_color="$COLOR_DARK_GRAY" \
  popup.background.shadow.drawing=on \
  popup.background.drawing=on \
  click_script="sketchybar --set config popup.drawing=toggle"

sketchybar --add item config.category_font popup.config \
  --set config.category_font \
  icon=󰛖 \
  label="FONT" \
  icon.drawing=off \
  label.color="$COLOR_GREEN" \
  label.font="$SBAR_LABEL_FONT_FACE_BOLD:12.0" \
  label.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  background.drawing=off \
  click_script=""

sketchybar --add item config.icon_font_family popup.config \
  --set config.icon_font_family \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Icon Font Family" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/icon_font_family.sh"

sketchybar --add item config.label_font_family popup.config \
  --set config.label_font_family \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Label Font Family" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/label_font_family.sh"

sketchybar --add item config.icon_size popup.config \
  --set config.icon_size \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Icon Size" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/icon_size.sh"

sketchybar --add item config.label_size popup.config \
  --set config.label_size \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Label Size" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/label_size.sh"

sketchybar --add item config.app_icon_size popup.config \
  --set config.app_icon_size \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="App Icon Size" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/app_icon_size.sh"

sketchybar --add item config.category_widget popup.config \
  --set config.category_widget \
  icon= \
  label="WIDGET" \
  icon.drawing=off \
  label.color="$COLOR_GREEN" \
  label.font="$SBAR_LABEL_FONT_FACE_BOLD:12.0" \
  label.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  background.drawing=off \
  click_script=""

sketchybar --add item config.theme popup.config \
  --set config.theme \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Theme" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/theme.sh"

sketchybar --add item config.bar_background popup.config \
  --set config.bar_background \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Bar Background" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/bar_background.sh"

sketchybar --add item config.clock_format popup.config \
  --set config.clock_format \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Clock Format" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/clock_format.sh"

sketchybar --add item config.weather_location popup.config \
  --set config.weather_location \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Weather Location" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/weather_location.sh"

sketchybar --add item config.netstat_graph popup.config \
  --set config.netstat_graph \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Netstat Graph" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/netstat_graph.sh"

sketchybar --add item config.netstat_speed popup.config \
  --set config.netstat_speed \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Netstat Speed" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/netstat_speed.sh"

sketchybar --add item config.config_visible popup.config \
  --set config.config_visible \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Config Item Visible" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/config_visible.sh"

sketchybar --add item config.widgets_right popup.config \
  --set config.widgets_right \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Right Widgets" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  click_script="$SBAR_PLUGIN_DIR/config/widgets_right.sh"

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
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  icon.color="$COLOR_GREEN" \
  label.color="$COLOR_GREEN" \
  click_script="sketchybar --reload"

sketchybar --add item config.reset popup.config \
  --set config.reset \
  icon= \
  icon.padding_left="$SBAR_POPUP_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_POPUP_ICON_PADDING_RIGHT" \
  label="Reset to Default" \
  label.padding_right="$SBAR_POPUP_PADDING_RIGHT" \
  icon.color="$COLOR_RED" \
  label.color="$COLOR_RED" \
  click_script="$SBAR_PLUGIN_DIR/config/reset.sh"
