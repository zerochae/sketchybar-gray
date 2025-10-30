#!/usr/bin/env bash

get_spaces() {
  yabai -m query --spaces | jq -r '.[].index'
}

get_space_apps() {
  local sid=$1
  yabai -m query --windows --space "$sid" 2>/dev/null | jq -r '.[].app' | sort -u | grep -v '^$'
}

get_space_click_command() {
  local sid=$1
  echo "yabai -m space --focus $sid"
}
