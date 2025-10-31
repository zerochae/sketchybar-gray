#!/usr/bin/env bash

get_spaces() {
  echo "1"
}

get_space_apps() {
  osascript -e 'tell application "System Events" to get name of (processes where background only is false)' 2>/dev/null | \
    tr ',' '\n' | \
    sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | \
    grep -v -E '^(Finder|Dock|osascript)$'
}

get_space_click_command() {
  local sid=$1
  echo "osascript -e 'tell application \"System Events\" to tell expose preferences to set spaces rows to 1' && open -a 'Mission Control' && sleep 0.1 && osascript -e 'tell application \"System Events\" to keystroke \"$sid\"'"
}
