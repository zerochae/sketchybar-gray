#!/usr/bin/env bash

source "$CONFIG_DIR/icons/apps.sh"
source "$CONFIG_DIR/icons/system.sh"

# Variable set by __icon_map in apps.sh and __system_icon_map in system.sh
icon_result=""

get_app_icon() {
  local app_name="$1"
  __icon_map "$app_name"
  echo "$icon_result"
}

get_system_icon() {
  local icon_name="$1"
  __system_icon_map "$icon_name"
  echo "$icon_result"
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
