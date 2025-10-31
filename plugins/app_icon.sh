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
    icon=$(get_icon_from_json "fa-microchip")
    ;;
  "ram")
    icon=$(get_icon_from_json "fa-memory")
    ;;
  "disk")
    icon=$(get_icon_from_json "fa-hdd_o")
    ;;
  "weather")
    icon=$(get_icon_from_json "weather")
    ;;
  "weather_sunny")
    icon=$(get_icon_from_json "weather-day_sunny")
    ;;
  "weather_cloudy")
    icon=$(get_icon_from_json "weather-day_cloudy")
    ;;
  "weather_rainy")
    icon=$(get_icon_from_json "weather-day_rain")
    ;;
  "weather_lightning")
    icon=$(get_icon_from_json "weather-day_lightning")
    ;;
  "weather_snowy")
    icon=$(get_icon_from_json "weather-day_snow")
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
