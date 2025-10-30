#!/usr/bin/env bash

source "$CONFIG_DIR/tokens/colors.sh"
source "$CONFIG_DIR/plugins/app_icon.sh"

if command -v yabai >/dev/null 2>&1; then
  source "$CONFIG_DIR/plugins/yabai.sh"
else
  source "$CONFIG_DIR/plugins/mission_control.sh"
fi

APPS=$(get_space_apps "$SID")

ICONS=""

if [ -n "$APPS" ]; then
  while IFS= read -r app; do
    if [ -n "$app" ]; then
      ICON=$(get_icon "$app")
      ICONS="$ICONS$ICON "
    fi
  done <<< "$APPS"
  ICONS="${ICONS% }"
fi

if [ -z "$ICONS" ]; then
  ICON_PADDING=4
  ICON_PADDING_RIGHT=4
  LABEL_DRAWING=on
else
  ICON_PADDING=8
  ICON_PADDING_RIGHT=8
  LABEL_DRAWING=off
fi

if [ "$SELECTED" = "true" ]; then
  ICON_COLOR="$COLOR_BLACK"
  LABEL_COLOR="$COLOR_BLACK"
  BG_COLOR="$COLOR_GREEN1"
else
  ICON_COLOR="$COLOR_LIGHT_GRAY"
  LABEL_COLOR="$COLOR_LIGHT_GRAY"
  BG_COLOR="$COLOR_BG2_75"
fi

sketchybar --set "$NAME" \
  icon="$ICONS" \
  icon.padding_left="$ICON_PADDING" \
  icon.padding_right="$ICON_PADDING_RIGHT" \
  icon.color="$ICON_COLOR" \
  label.drawing="$LABEL_DRAWING" \
  label.color="$LABEL_COLOR" \
  background.color="$BG_COLOR" \
  background.drawing="on"
