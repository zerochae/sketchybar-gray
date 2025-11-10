#!/usr/bin/env bash

BIN_DIR="$HOME/.config/sketchybar/bin"
DEV_BIN="$BIN_DIR/dev"
PROD_BIN="$BIN_DIR/settings"

sketchybar --set config popup.drawing=off 2>/dev/null

if [ -x "$DEV_BIN" ]; then
  SETTINGS_BIN="$DEV_BIN"
elif [ -x "$PROD_BIN" ]; then
  SETTINGS_BIN="$PROD_BIN"
else
  echo "Settings binary not found in $BIN_DIR"
  exit 1
fi

if pgrep -f "$SETTINGS_BIN" > /dev/null; then
  osascript -e 'tell application "System Events" to set frontmost of first process whose unix id is '$(pgrep -f "$SETTINGS_BIN")' to true' 2>/dev/null
  exit 0
fi

"$SETTINGS_BIN" &
exit 0
