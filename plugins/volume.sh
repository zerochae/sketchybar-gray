#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"
source "$CONFIG_DIR/core/env.sh"

VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")

if [ "$MUTED" = "true" ]; then
  ICON=$(get_widget_icon "volume_mute")
  LABEL=""
  PADDING="0"
else
  if [ "$VOLUME" -gt 66 ]; then
    ICON=$(get_widget_icon "volume_high")
  elif [ "$VOLUME" -gt 33 ]; then
    ICON=$(get_widget_icon "volume_medium")
  elif [ "$VOLUME" -gt 0 ]; then
    ICON=$(get_widget_icon "volume_low")
  else
    ICON=$(get_widget_icon "volume_mute")
  fi
  LABEL="${VOLUME}%"
  PADDING="$SBAR_ITEM_LABEL_PADDING_RIGHT"
fi

sketchybar --set volume.icon icon="$ICON"
sketchybar --set volume.label label="$LABEL" label.padding_right="$PADDING"
