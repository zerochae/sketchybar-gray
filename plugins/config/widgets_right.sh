#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/config/helpers.sh"

sketchybar --set config popup.drawing=off

ALL_WIDGETS=("clock" "weather" "caffeinate" "volume" "battery" "disk" "ram" "cpu" "kakaotalk" "netstat")

CURRENT=$(get_config_value "SBAR_WIDGETS_RIGHT_ENABLED")
if [ -z "$CURRENT" ]; then
  CURRENT_ARRAY=("${SBAR_WIDGETS_RIGHT[@]}")
  CURRENT="${CURRENT_ARRAY[*]}"
fi

CURRENT="${CURRENT// config/}"
CURRENT="${CURRENT//config /}"

read -ra ENABLED_WIDGETS <<< "$CURRENT"

APPLESCRIPT_ALL=""
for widget in "${ALL_WIDGETS[@]}"; do
  APPLESCRIPT_ALL+="\"$widget\", "
done
APPLESCRIPT_ALL="${APPLESCRIPT_ALL%, }"

APPLESCRIPT_ENABLED=""
for widget in "${ENABLED_WIDGETS[@]}"; do
  APPLESCRIPT_ENABLED+="\"$widget\", "
done
APPLESCRIPT_ENABLED="${APPLESCRIPT_ENABLED%, }"

RESULT=$(osascript <<EOF
set allWidgets to {$APPLESCRIPT_ALL}
set selectedWidgets to {$APPLESCRIPT_ENABLED}
set finalList to {}

repeat
  set availableWidgets to {}
  repeat with w in allWidgets
    set widgetName to w as string
    set isSelected to false
    repeat with s in finalList
      if s as string = widgetName then
        set isSelected to true
        exit repeat
      end if
    end repeat
    if not isSelected then
      set end of availableWidgets to widgetName
    end if
  end repeat

  if (count of availableWidgets) = 0 then
    exit repeat
  end if

  set end of availableWidgets to "✓ Done"

  set currentListStr to ""
  if (count of finalList) > 0 then
    set idx to 1
    repeat with w in finalList
      set currentListStr to currentListStr & (idx as string) & ". " & (w as string) & "\\n"
      set idx to idx + 1
    end repeat
  else
    set currentListStr to "(empty)"
  end if

  set choice to choose from list availableWidgets with prompt "Current order:\\n" & currentListStr & "\\nSelect widget to add:" without multiple selections allowed

  if choice is false then
    return ""
  end if

  set selectedItem to item 1 of choice
  if selectedItem = "✓ Done" then
    exit repeat
  end if

  set end of finalList to selectedItem
end repeat

set AppleScript's text item delimiters to " "
return finalList as string
EOF
)

if [ -n "$RESULT" ]; then
  set_config_value "SBAR_WIDGETS_RIGHT_ENABLED" "$RESULT config"
  sketchybar --reload
fi
