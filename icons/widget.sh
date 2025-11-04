#!/usr/bin/env bash

### START-OF-WIDGET-ICON-MAP
function __widget_icon_map() {
  case "$1" in
  "block-1")
    icon_result="▁"
    ;;

  "block-2")
    icon_result="▂"
    ;;

  "block-3")
    icon_result="▃"
    ;;

  "block-4")
    icon_result="▄"
    ;;

  "block-5")
    icon_result="▅"
    ;;

  "block-6")
    icon_result="▆"
    ;;

  "block-7")
    icon_result="▇"
    ;;

  "block-8")
    icon_result="█"
    ;;

  "battery_empty")
    icon_result=""
    ;;

  "battery_low")
    icon_result=""
    ;;

  "battery_medium")
    icon_result=""
    ;;

  "battery_full")
    icon_result=""
    ;;

  "clock")
    icon_result=""
    ;;

  "network_download")
    icon_result=""
    ;;

  "network_upload")
    icon_result=""
    ;;

  "disk")
    icon_result=""
    ;;

  "loading")
    icon_result=""
    ;;

  "volume_medium")
    icon_result=""
    ;;

  "volume_low")
    icon_result=""
    ;;

  "volume_high")
    icon_result=""
    ;;

  "volume_mute")
    icon_result="󰝟"
    ;;

  "cpu")
    icon_result=""
    ;;

  "coffee_on")
    icon_result="󰅶"
    ;;

  "coffee_off")
    icon_result="󰶞"
    ;;

  "memory")
    icon_result="󰍛"
    ;;

  "config")
    icon_result=""
    ;;

  *)
    icon_result=""
    ;;
  esac
}
### END-OF-WIDGET-ICON-MAP
