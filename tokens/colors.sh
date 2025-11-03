#!/usr/bin/env bash

# Color theme loader
# Used by plugins that need to dynamically update colors

# Set CONFIG_DIR if not set
CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"

# Get theme from user config or use default
USER_CONFIG="$HOME/.config/sketchybar/user.sketchybarrc"
if [ -f "$USER_CONFIG" ]; then
  THEME=$(grep "^export SBAR_THEME=" "$USER_CONFIG" | sed 's/.*="\(.*\)"/\1/' | sed 's/.*=\(.*\)/\1/')
fi

THEME="${THEME:-onedark}"
THEME_FILE="$CONFIG_DIR/tokens/themes/$THEME.sh"

if [ -f "$THEME_FILE" ]; then
  source "$THEME_FILE"
else
  source "$CONFIG_DIR/tokens/themes/onedark.sh"
fi
