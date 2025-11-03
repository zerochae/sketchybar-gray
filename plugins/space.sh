#!/usr/bin/env bash

source "$CONFIG_DIR/tokens/colors.sh"
source "$CONFIG_DIR/plugins/app_icon.sh"

USER_CONFIG="$HOME/.config/sketchybar/user.sketchybarrc"
if [ -f "$USER_CONFIG" ]; then
  source "$USER_CONFIG"
fi

SBAR_APP_ICON_FONT="${SBAR_APP_ICON_FONT:-sketchybar-app-font}"
SBAR_APP_ICON_FONT_SIZE="${SBAR_APP_ICON_FONT_SIZE:-24.0}"
BG_HEIGHT=24

if command -v yabai >/dev/null 2>&1; then
  source "$CONFIG_DIR/plugins/yabai.sh"
  APPS=$(get_space_apps "$SID")
else
  source "$CONFIG_DIR/plugins/mission_control.sh"
  APPS=$(get_space_apps)
  SELECTED="true"
fi

ICONS=""
if [ -n "$APPS" ]; then
  while IFS= read -r app; do
    [ -n "$app" ] && ICONS="$ICONS$(get_icon "$app") "
  done <<<"$APPS"
  ICONS="${ICONS% }"
fi

if [ -z "$ICONS" ]; then
  ICON_PADDING=4
  LABEL_DRAWING=on
else
  ICON_PADDING=8
  LABEL_DRAWING=off
fi

if [ "$THEME_TYPE" = "light" ]; then
  if [ "$SELECTED" = "true" ]; then
    ICON_COLOR="$COLOR_BLACK"
    LABEL_COLOR="$COLOR_BLACK"
    BG_COLOR="$COLOR_GREEN"
    BORDER_COLOR="$COLOR_GREEN"
    ICON_SIZE=$(echo "$SBAR_APP_ICON_FONT_SIZE + 0.5" | bc)
    BG_HEIGHT=$(echo "$BG_HEIGHT + 0.5" | bc)
  else
    ICON_COLOR="$COLOR_LIGHT_GRAY"
    LABEL_COLOR="$COLOR_LIGHT_GRAY"
    BG_COLOR="$COLOR_BG2_75"
    BORDER_COLOR="$COLOR_GREEN_50"
    ICON_SIZE=$(echo "$SBAR_APP_ICON_FONT_SIZE - 1.5" | bc)
    BG_HEIGHT=$(echo "$BG_HEIGHT - 1.5" | bc)
  fi
else
  if [ "$SELECTED" = "true" ]; then
    ICON_COLOR="$COLOR_BLACK"
    LABEL_COLOR="$COLOR_BLACK"
    BG_COLOR="$COLOR_GREEN"
    BORDER_COLOR="$COLOR_GREEN"
    ICON_SIZE=$(echo "$SBAR_APP_ICON_FONT_SIZE + 0.5" | bc)
    BG_HEIGHT=$(echo "$BG_HEIGHT + 0.5" | bc)
  else
    ICON_COLOR="$COLOR_LIGHT_GRAY"
    LABEL_COLOR="$COLOR_LIGHT_GRAY"
    BG_COLOR="$COLOR_BG2_75"
    BORDER_COLOR="$COLOR_GREEN_50"
    ICON_SIZE=$(echo "$SBAR_APP_ICON_FONT_SIZE - 1.5" | bc)
    BG_HEIGHT=$(echo "$BG_HEIGHT - 1.5" | bc)
  fi
fi

sketchybar --set "$NAME" \
  icon="$ICONS" \
  icon.font="$SBAR_APP_ICON_FONT:Regular:$ICON_SIZE" \
  icon.padding_left="$ICON_PADDING" \
  icon.padding_right="$ICON_PADDING" \
  icon.color="$ICON_COLOR" \
  label.drawing="$LABEL_DRAWING" \
  label.color="$LABEL_COLOR" \
  background.color="$BG_COLOR" \
  background.border_color="$BORDER_COLOR" \
  background.drawing="on" \
  background.height="$BG_HEIGHT"
