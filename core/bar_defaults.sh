#!/usr/bin/env bash

sketchybar \
  --default \
  icon.font="$SBAR_ICON_FONT_FACE_BOLD:$SBAR_ICON_FONT_SIZE" \
  label.font="$SBAR_LABEL_FONT_FACE_BOLD:$SBAR_LABEL_FONT_SIZE" \
  icon.color="$SBAR_DEFAULT_ICON_COLOR" \
  label.color="$SBAR_DEFAULT_LABEL_COLOR" \
  --bar \
  position="$SBAR_BAR_POSITION" \
  height="$SBAR_BAR_HEIGHT" \
  color="$SBAR_BAR_COLOR"
