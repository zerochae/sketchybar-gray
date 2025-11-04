#!/usr/bin/env bash

source "$CONFIG_DIR/icons/apps.sh"

get_icon_from_json() {
  local icon_name="$1"
  local use_contains="${2:-true}"
  local icon_json="$CONFIG_DIR/icons/system.json"

  if [ "$use_contains" = "true" ]; then
    jq -r ".[] | select(.name | contains(\"$icon_name\")) | .char" "$icon_json" | head -1
  else
    jq -r ".[] | select(.name == \"$icon_name\") | .char" "$icon_json" | head -1
  fi
}

get_icon() {
  local app_name="$1"
  __icon_map "$app_name"
  echo "$icon_result"
}

get_system_icon() {
  local item_name="$1"
  local percentage="$2"
  local icon=""

  case "$item_name" in
  "clock")
    icon=$(get_icon_from_json "fa-clock" false)
    ;;
  "cpu")
    icon=$(get_icon_from_json "fae-chip")
    ;;
  "ram")
    icon=$(get_icon_from_json "md-memory")
    ;;
  "disk")
    icon=$(get_icon_from_json "fa-hdd_o")
    ;;
  "network")
    icon=$(get_icon_from_json "fa-network")
    ;;
  "network_down")
    icon=$(get_icon_from_json "fa-cloud_upload")
    ;;
  "network_up")
    icon=$(get_icon_from_json "fa-cloud_download")
    ;;
  "volume")
    icon=$(get_icon_from_json "md-volume_mute")
    ;;
  "volume_high")
    icon=$(get_icon_from_json "fa-volume_up")
    ;;
  "volume_medium")
    icon=$(get_icon_from_json "fa-volume_down")
    ;;
  "volume_low")
    icon=$(get_icon_from_json "fa-volume_off")
    ;;
  "volume_muted")
    icon=$(get_icon_from_json "md-volume_mute")
    ;;
  "battery_charging")
    icon=$(get_icon_from_json "fa-battery_4" false)
    ;;
  "config")
    icon=$(get_icon_from_json "seti-config" false)
    ;;
  "battery")
    if [ "$percentage" -ge 75 ]; then
      icon=$(get_icon_from_json "fa-battery_4" false)
    elif [ "$percentage" -ge 50 ]; then
      icon=$(get_icon_from_json "fa-battery_3" false)
    elif [ "$percentage" -ge 25 ]; then
      icon=$(get_icon_from_json "fa-battery_2" false)
    else
      icon=$(get_icon_from_json "fa-battery_1" false)
    fi
    ;;
  *)
    icon=""
    ;;
  esac

  echo "$icon"
}

get_weather_icon_day() {
  case "$1" in
  113) echo "" ;; 116) echo "" ;; 119) echo "" ;; 122) echo "" ;;
  143 | 248 | 260) echo "" ;;
  176 | 185 | 263 | 266 | 281 | 284 | 293 | 296 | 299 | 302 | 305 | 308 | 311 | 314) echo "" ;;
  179 | 227 | 230 | 323 | 326 | 329 | 332 | 335 | 338 | 368 | 371) echo "" ;;
  182 | 317 | 320 | 362 | 365) echo "" ;;
  200 | 386 | 389) echo "" ;;
  350 | 374 | 377) echo "" ;;
  392 | 395) echo "" ;;
  353 | 356 | 359) echo "" ;;
  *) echo "" ;;
  esac
}

get_weather_icon_night() {
  case "$1" in
  113) echo "" ;; 116 | 122) echo "" ;; 119) echo "" ;;
  143 | 248 | 260) echo "" ;;
  176 | 185 | 263 | 266 | 281 | 284 | 293 | 296 | 299 | 302 | 305 | 308 | 311 | 314) echo "" ;;
  179 | 227 | 230 | 323 | 326 | 329 | 332 | 335 | 338 | 368 | 371) echo "" ;;
  182 | 317 | 320 | 362 | 365) echo "" ;;
  200 | 386 | 389) echo "" ;;
  350 | 374 | 377) echo "" ;;
  392 | 395) echo "" ;;
  353 | 356 | 359) echo "" ;;
  *) echo "" ;;
  esac
}
