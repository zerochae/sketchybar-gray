#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"

WEATHER_JSON=$(curl -s "wttr.in/$SBAR_WEATHER_LOCATION?format=j1" 2>/dev/null)

if [ -z "$WEATHER_JSON" ]; then
  TEMP="N/A"
  WEATHER_CODE="113"
else
  TEMP=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].temp_C')
  WEATHER_CODE=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].weatherCode')
  IS_DAY=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].cloudcover' | awk '{if ($1 < 50) print "day"; else print "day"}')
fi

case "$WEATHER_CODE" in
  113)
    ICON=$(get_system_icon "weather_sunny")
    ;;
  116 | 119)
    ICON=$(get_system_icon "weather_cloudy")
    ;;
  122 | 143 | 248 | 260)
    ICON=$(get_system_icon "weather_cloudy")
    ;;
  176 | 263 | 266 | 293 | 296 | 299 | 302 | 305 | 308 | 353 | 356 | 359)
    ICON=$(get_system_icon "weather_rainy")
    ;;
  200 | 386 | 389 | 392 | 395)
    ICON=$(get_system_icon "weather_lightning")
    ;;
  179 | 182 | 185 | 227 | 230 | 281 | 284 | 311 | 314 | 317 | 320 | 323 | 326 | 329 | 332 | 335 | 338 | 350 | 362 | 365 | 368 | 371 | 374 | 377)
    ICON=$(get_system_icon "weather_snowy")
    ;;
  *)
    ICON=$(get_system_icon "weather")
    ;;
esac

sketchybar --set weather.icon icon="$ICON"
sketchybar --set weather.label label="${TEMP}°C"
