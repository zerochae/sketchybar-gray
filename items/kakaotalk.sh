#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

KAKAO_ICON=$(get_app_icon "KakaoTalk")

sketchybar --add item kakaotalk.badge right \
  --set kakaotalk.badge \
  label.drawing=off \
  label.font="$SBAR_LABEL_FONT_FACE_BOLD:7.0" \
  label.color="0xFFFFFFFF" \
  label.padding_left=4 \
  label.padding_right=4 \
  background.color="$COLOR_RED" \
  background.corner_radius=7 \
  background.height=14 \
  background.drawing=off \
  y_offset=-10

sketchybar --add item kakaotalk.icon right \
  --set kakaotalk.icon \
  icon="$KAKAO_ICON" \
  icon.font="$SBAR_APP_ICON_FONT:Regular:$SBAR_APP_ICON_FONT_SIZE" \
  icon.color="$COLOR_BLACK" \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT" \
  update_freq=10 \
  script="$SBAR_PLUGIN_DIR/kakaotalk.sh" \
  click_script="open -a KakaoTalk"

