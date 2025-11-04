#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"

VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")

if [ "$MUTED" = "true" ]; then
  ICON=$(get_widget_icon "volume_mute")
  LABEL="Muted"
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
fi

sketchybar --set volume.icon icon="$ICON"
sketchybar --set volume.label label="$LABEL"
