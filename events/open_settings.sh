#!/usr/bin/env bash

BIN_DIR="$HOME/.config/sketchybar/bin"
DEV_BIN="$BIN_DIR/dev"
PROD_BIN="$BIN_DIR/settings"

# Close popup if it exists
sketchybar --set config popup.drawing=off 2>/dev/null

# Determine which binary to use (dev takes priority)
if [ -x "$DEV_BIN" ]; then
  SETTINGS_BIN="$DEV_BIN"
elif [ -x "$PROD_BIN" ]; then
  SETTINGS_BIN="$PROD_BIN"
else
  echo "Settings binary not found in $BIN_DIR"
  exit 1
fi

# Check if app is already running
if pgrep -f "$SETTINGS_BIN" > /dev/null; then
  osascript -e 'tell application "System Events" to set frontmost of first process whose unix id is '$(pgrep -f "$SETTINGS_BIN")' to true' 2>/dev/null
  exit 0
fi

# Run the settings app
"$SETTINGS_BIN" &
exit 0
