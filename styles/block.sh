#!/usr/bin/env bash

if [ "$SBAR_CONFIG_VISIBLE" = "true" ]; then
  sketchybar --add bracket "config" "/config/" \
    --set "config" \
    background.color="$SBAR_COLOR_CONFIG" \
    background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
    background.height="$SBAR_ITEM_BG_HEIGHT" \
    background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
    background.drawing=on

  sketchybar --set "/config/" icon.color="$COLOR_BLACK"
fi

sketchybar --add bracket "clock" "/clock\..*/" \
  --set "clock" \
  background.color="$SBAR_COLOR_CLOCK" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/clock\..*/" icon.color="$COLOR_BLACK" label.color="$COLOR_BLACK"

sketchybar --add bracket "calendar" "/calendar\..*/" \
  --set "calendar" \
  background.color="$SBAR_COLOR_CALENDAR" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/calendar\..*/" icon.color="$COLOR_BLACK" label.color="$COLOR_BLACK"

sketchybar --add bracket "weather" "/weather\..*/" \
  --set "weather" \
  background.color="$SBAR_COLOR_WEATHER" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/weather\..*/" icon.color="$COLOR_BLACK" label.color="$COLOR_BLACK"

sketchybar --add bracket "caffeinate" "/caffeinate\..*/" \
  --set "caffeinate" \
  background.color="$SBAR_COLOR_CAFFEINATE" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/caffeinate\..*/" icon.color="$COLOR_BLACK"

sketchybar --add bracket "volume" "/volume\..*/" \
  --set "volume" \
  background.color="$SBAR_COLOR_VOLUME" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/volume\..*/" icon.color="$COLOR_BLACK" label.color="$COLOR_BLACK"

sketchybar --add bracket "battery" "/battery\..*/" \
  --set "battery" \
  background.color="$SBAR_COLOR_BATTERY" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/battery\..*/" icon.color="$COLOR_BLACK" label.color="$COLOR_BLACK"

sketchybar --add bracket "disk" "/disk\..*/" \
  --set "disk" \
  background.color="$SBAR_COLOR_DISK" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/disk\..*/" icon.color="$COLOR_BLACK" label.color="$COLOR_BLACK"

sketchybar --add bracket "ram" "/ram\..*/" \
  --set "ram" \
  background.color="$SBAR_COLOR_RAM" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/ram\..*/" icon.color="$COLOR_BLACK" label.color="$COLOR_BLACK"

sketchybar --add bracket "cpu" "/cpu\..*/" \
  --set "cpu" \
  background.color="$SBAR_COLOR_CPU" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/cpu\..*/" icon.color="$COLOR_BLACK" label.color="$COLOR_BLACK"

sketchybar --add bracket "netstat" "/netstat\..*/" \
  --set "netstat" \
  background.color="$SBAR_COLOR_NETSTAT" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/netstat\..*/" icon.color="$COLOR_BLACK" label.color="$COLOR_BLACK"

sketchybar --add bracket "kakaotalk" "/kakaotalk\.icon/" \
  --set "kakaotalk" \
  background.color="$SBAR_COLOR_KAKAOTALK" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/kakaotalk\.icon/" icon.color="$COLOR_BLACK"

source "$CONFIG_DIR/tokens/helpers.sh"
BADGE_COLOR=$(get_badge_label_color)
sketchybar --set kakaotalk.badge label.color="$BADGE_COLOR"

sketchybar --add bracket "front_app" "/front_app\..*/" \
  --set "front_app" \
  background.color="$SBAR_COLOR_FRONT_APP" \
  background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
  background.height="$SBAR_ITEM_BG_HEIGHT" \
  background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
  background.drawing=on

sketchybar --set "/front_app\..*/" icon.color="$COLOR_BLACK" label.color="$COLOR_BLACK"
