#!/usr/bin/env bash

calc() {
  local expression="$1"
  awk "BEGIN {print $expression}"
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
