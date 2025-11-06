#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

open_with_editor() {
  local cmd=$1
  local app_name=$2

  if command -v "$cmd" &>/dev/null; then
    "$cmd" "$USER_CONFIG"
    return 0
  elif [ -n "$app_name" ] && open -Ra "$app_name" 2>/dev/null; then
    open -a "$app_name" "$USER_CONFIG"
    return 0
  fi
  return 1
}

open_with_terminal_editor() {
  local cmd=$1

  if command -v "$cmd" &>/dev/null; then
    osascript -e "tell application \"Terminal\" to do script \"$cmd '$USER_CONFIG'\""
    return 0
  fi
  return 1
}

open_with_editor "code" "Visual Studio Code" ||
  open_with_editor "cursor" "Cursor" ||
  open_with_editor "zed" "Zed" ||
  open_with_editor "subl" "Sublime Text" ||
  open_with_terminal_editor "nvim" ||
  open_with_terminal_editor "vim" ||
  open "$USER_CONFIG"
