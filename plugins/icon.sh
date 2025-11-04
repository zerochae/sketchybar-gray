#!/usr/bin/env bash

source "$CONFIG_DIR/icons/apps.sh"
source "$CONFIG_DIR/icons/widget.sh"
source "$CONFIG_DIR/icons/weather.sh"

# Variable set by __icon_map in apps.sh and __widget_icon_map in widget.sh
icon_result=""

get_app_icon() {
  local app_name="$1"
  __icon_map "$app_name"
  echo "$icon_result"
}

get_widget_icon() {
  local icon_name="$1"
  __widget_icon_map "$icon_name"
  echo "$icon_result"
}

get_weather_icon() {
  local code="$1"
  local is_day="$2"
  local icon_name
  local suffix

  suffix=$([ "$is_day" -eq 1 ] && echo "_day" || echo "_night")

  case "$code" in
  113)
    icon_name="weather_clear${suffix}"
    ;;
  116 | 122)
    icon_name="weather_partly_cloudy${suffix}"
    ;;
  119)
    icon_name="weather_cloudy${suffix}"
    ;;
  143 | 248 | 260)
    icon_name="weather_fog${suffix}"
    ;;
  176 | 185 | 263 | 266 | 281 | 284 | 293 | 296 | 299 | 302 | 305 | 308 | 311 | 314 | 353 | 356 | 359)
    icon_name="weather_rain${suffix}"
    ;;
  179 | 227 | 230 | 323 | 326 | 329 | 332 | 335 | 338 | 368 | 371)
    icon_name="weather_snow${suffix}"
    ;;
  350 | 374 | 377 | 392 | 395)
    icon_name="weather_hail${suffix}"
    ;;
  182 | 317 | 320 | 362 | 365)
    icon_name="weather_sleet${suffix}"
    ;;
  200 | 386 | 389)
    icon_name="weather_thunderstorm${suffix}"
    ;;
  *)
    icon_name="weather_default"
    ;;
  esac

  __weather_icon_map "$icon_name"
  echo "$icon_result"
}
