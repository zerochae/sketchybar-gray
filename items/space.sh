#!/usr/bin/env bash

if command -v yabai >/dev/null 2>&1; then
  source "$SBAR_PLUGIN_DIR/yabai.sh"
else
  source "$SBAR_PLUGIN_DIR/mission_control.sh"
fi

workspaces=$(get_spaces)
first_workspace=$(echo "$workspaces" | head -n 1)
last_workspace=$(echo "$workspaces" | tail -n 1)

for sid in $workspaces; do
  CLICK_SCRIPT=$(get_space_click_command "$sid")

  sketchybar --add space "space.$sid" left \
    --set "space.$sid" \
    space="$sid" \
    icon="" \
    icon.font="$SBAR_APP_ICON_FONT:Regular:$SBAR_APP_ICON_FONT_SIZE" \
    icon.color="$COLOR_WHITE" \
    icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
    icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT" \
    label="$sid" \
    label.color="$COLOR_WHITE" \
    label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
    background.color="$SBAR_COLOR_SPACE" \
    background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
    background.height="$SBAR_ITEM_BG_HEIGHT" \
    background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
    background.border_color="$SBAR_COLOR_SPACE_BORDER" \
    background.drawing=on \
    padding_left=4 \
    padding_right=4 \
    script="$SBAR_PLUGIN_DIR/space.sh" \
    click_script="$CLICK_SCRIPT" \
    --subscribe "space.$sid" front_app_switched space_change
done

sketchybar --set "space.$first_workspace" padding_left=2
sketchybar --set "space.$last_workspace" padding_right=2
