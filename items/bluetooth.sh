#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

BLUETOOTH_APP="$HOME/.config/sketchybar/bin/bluetooth"

sketchybar --add item bluetooth.icon right \
  --set bluetooth.icon \
  icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
  icon.padding_right="$(calc "$SBAR_ITEM_LABEL_PADDING_RIGHT - 4")" \
  update_freq=5 \
  script="$SBAR_PLUGIN_DIR/bluetooth.sh" \
  click_script="if pgrep -x 'bluetooth' > /dev/null; then open -a '$BLUETOOTH_APP'; else '$BLUETOOTH_APP' & fi"
