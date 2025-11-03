#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

CURRENT=$(get_config_value "SBAR_THEME")
if [ -z "$CURRENT" ]; then
  CURRENT="onedark"
fi

THEMES="nord
tokyonight
ayudark
githubdark
onedark
onelight
ayulight
gruvboxlight
blossomlight
githublight"

RESULT=$(osascript <<EOF
set themeList to {"nord", "tokyonight", "ayudark", "githubdark", "onedark", "onelight", "ayulight", "gruvboxlight", "blossomlight", "githublight"}
set defaultTheme to "$CURRENT"

set defaultIndex to 1
repeat with i from 1 to count of themeList
  if item i of themeList is defaultTheme then
    set defaultIndex to i
    exit repeat
  end if
end repeat

choose from list themeList with prompt "Select a theme:" default items {item defaultIndex of themeList}
EOF
)

if [ "$RESULT" != "false" ] && [ -n "$RESULT" ]; then
  set_config_value "SBAR_THEME" "$RESULT"
  sketchybar --reload
fi
