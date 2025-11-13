#!/usr/bin/env bash

sketchybar --add event yabai_window_focus

sketchybar --add event system_woke \
  --add item system_woke left \
  --set system_woke \
  drawing=off \
  script="$SBAR_EVENT_DIR/system_woke.sh" \
  --subscribe system_woke system_woke
