#!/usr/bin/env bash

add_bracket_item() {
  local name=$1
  local bg_color=$2
  local items=("${@:3}")

  sketchybar --add bracket "$name" "${items[@]}" \
    --set "$name" \
    background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
    background.height="$SBAR_ITEM_BG_HEIGHT" \
    background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
    background.color="$bg_color" \
    background.drawing=on
}

add_item_with_icon_label() {
  local base_name=$1
  local position=$2
  local icon=$3
  local icon_font_size=${4:-"18.0"}
  local label=$5
  local icon_color=${6:-"$COLOR_BLACK"}
  local label_color=${7:-"$COLOR_BLACK"}
  local update_freq=${8:-""}
  local script=${9:-""}
  local subscribe=${10:-""}

  sketchybar --add item "${base_name}.icon" "$position" \
    --set "${base_name}.icon" \
    icon="$icon" \
    icon.font="SpaceMono Nerd Font Mono:Bold:${icon_font_size}" \
    icon.color="$icon_color" \
    icon.padding_left=8 \
    icon.padding_right=4

  local label_args=(--add item "${base_name}.label" "$position"
    --set "${base_name}.label"
    label="$label"
    label.color="$label_color"
    label.padding_right=8)

  [ -n "$update_freq" ] && label_args+=(update_freq="$update_freq")
  [ -n "$script" ] && label_args+=(script="$script")
  [ -n "$subscribe" ] && label_args+=(--subscribe "${base_name}.label" $subscribe)

  sketchybar "${label_args[@]}"
}
