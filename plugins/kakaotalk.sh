#!/usr/bin/env bash

source "$CONFIG_DIR/core/env.sh"
source "$CONFIG_DIR/tokens/colors.sh"

APP_NAME="KakaoTalk"
IS_RUNNING=$(pgrep -x "$APP_NAME" > /dev/null && echo "true" || echo "false")

if [ "$IS_RUNNING" = "false" ]; then
  sketchybar --set kakaotalk.icon drawing=off
  sketchybar --set kakaotalk.badge drawing=off
  sketchybar --set kakaotalk drawing=off
  exit 0
fi

BADGE_RAW=$(lsappinfo -all list | grep -A 1 "\"$APP_NAME\"" | grep "StatusLabel" | sed 's/.*"label"=//; s/"//g; s/ }.*//')

sketchybar --set kakaotalk.icon drawing=on

if [ -n "$BADGE_RAW" ] && [ "$BADGE_RAW" != "0" ] && [ "$BADGE_RAW" != "kCFNULL" ]; then
  sketchybar --set kakaotalk.badge \
    drawing=on \
    label="NEW" \
    label.drawing=on \
    background.drawing=on \
    y_offset=10 \
    padding_left=-22
else
  sketchybar --set kakaotalk.badge \
    drawing=off \
    label.drawing=off \
    background.drawing=off \
    y_offset=0 \
    padding_left=0
fi
