#!/usr/bin/env bash

if [ "$SBAR_CONFIG_VISIBLE" = "true" ]; then
  sketchybar --set "/config\..*/" icon.color="$SBAR_COLOR_CONFIG"
fi

sketchybar --set "/clock\..*/" icon.color="$SBAR_COLOR_CLOCK" label.color="$SBAR_COLOR_CLOCK"
sketchybar --set "/calendar\..*/" icon.color="$SBAR_COLOR_CALENDAR" label.color="$SBAR_COLOR_CALENDAR"
sketchybar --set "/weather\..*/" icon.color="$SBAR_COLOR_WEATHER" label.color="$SBAR_COLOR_WEATHER"
sketchybar --set "/caffeinate\..*/" icon.color="$SBAR_COLOR_CAFFEINATE"
sketchybar --set "/volume\..*/" icon.color="$SBAR_COLOR_VOLUME" label.color="$SBAR_COLOR_VOLUME"
sketchybar --set "/battery\..*/" icon.color="$SBAR_COLOR_BATTERY" label.color="$SBAR_COLOR_BATTERY"
sketchybar --set "/disk\..*/" icon.color="$SBAR_COLOR_DISK" label.color="$SBAR_COLOR_DISK"
sketchybar --set "/ram\..*/" icon.color="$SBAR_COLOR_RAM" label.color="$SBAR_COLOR_RAM"
sketchybar --set "/cpu\..*/" icon.color="$SBAR_COLOR_CPU" label.color="$SBAR_COLOR_CPU"
sketchybar --set "/netstat\..*/" icon.color="$SBAR_COLOR_NETSTAT" label.color="$SBAR_COLOR_NETSTAT"
sketchybar --set "/kakaotalk\.icon/" icon.color="$SBAR_COLOR_KAKAOTALK"
sketchybar --set "/front_app\..*/" icon.color="$SBAR_COLOR_FRONT_APP" label.color="$SBAR_COLOR_FRONT_APP"

source "$CONFIG_DIR/tokens/helpers.sh"
BADGE_COLOR=$(get_badge_label_color)
sketchybar --set kakaotalk.badge label.color="$BADGE_COLOR"

LEFT_ITEMS=()
CENTER_ITEMS=()
RIGHT_ITEMS=()

for widget in "${SBAR_WIDGETS_LEFT[@]}"; do
  widget_name="${widget%% *}"
  [ "$widget_name" = "config" ] && [ "$SBAR_CONFIG_VISIBLE" = "false" ] && continue
  [ "$widget_name" = "space" ] && LEFT_ITEMS+=("/space\\..*/") && continue
  LEFT_ITEMS+=("/${widget_name}\\.icon/" "/${widget_name}\\.label/" "/${widget_name}\\.name/" "/${widget_name}\\.percent/" "/${widget_name}\\.graph/")
done

for widget in "${SBAR_WIDGETS_CENTER[@]}"; do
  widget_name="${widget%% *}"
  [ "$widget_name" = "config" ] && [ "$SBAR_CONFIG_VISIBLE" = "false" ] && continue
  [ "$widget_name" = "space" ] && CENTER_ITEMS+=("/space\\..*/") && continue
  CENTER_ITEMS+=("/${widget_name}\\.icon/" "/${widget_name}\\.label/" "/${widget_name}\\.name/" "/${widget_name}\\.percent/" "/${widget_name}\\.graph/")
done

for widget in "${SBAR_WIDGETS_RIGHT[@]}"; do
  widget_name="${widget%% *}"
  [ "$widget_name" = "config" ] && [ "$SBAR_CONFIG_VISIBLE" = "false" ] && continue
  [ "$widget_name" = "space" ] && RIGHT_ITEMS+=("/space\\..*/") && continue
  RIGHT_ITEMS+=("/${widget_name}\\.icon/" "/${widget_name}\\.label/" "/${widget_name}\\.name/" "/${widget_name}\\.percent/" "/${widget_name}\\.graph/")
done

if [ ${#LEFT_ITEMS[@]} -gt 0 ]; then
  sketchybar --add bracket "container_left" "${LEFT_ITEMS[@]}" \
    --set "container_left" \
    background.color="$SBAR_COMPACT_BG_COLOR" \
    background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
    background.height="$SBAR_ITEM_BG_HEIGHT" \
    background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
    background.drawing=on
fi

if [ ${#CENTER_ITEMS[@]} -gt 0 ]; then
  sketchybar --add bracket "container_center" "${CENTER_ITEMS[@]}" \
    --set "container_center" \
    background.color="$SBAR_COMPACT_BG_COLOR" \
    background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
    background.height="$SBAR_ITEM_BG_HEIGHT" \
    background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
    background.drawing=on
fi

if [ ${#RIGHT_ITEMS[@]} -gt 0 ]; then
  sketchybar --add bracket "container_right" "${RIGHT_ITEMS[@]}" \
    --set "container_right" \
    background.color="$SBAR_COMPACT_BG_COLOR" \
    background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
    background.height="$SBAR_ITEM_BG_HEIGHT" \
    background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH" \
    background.drawing=on
fi
