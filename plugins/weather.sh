#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"

WEATHER_JSON=$(curl -s "wttr.in/$SBAR_WEATHER_LOCATION?format=j1" 2>/dev/null)

if [ -z "$WEATHER_JSON" ]; then
  TEMP="N/A"
  WEATHER_CODE="113"
  IS_DAY=1
else
  TEMP=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].temp_C')
  WEATHER_CODE=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].weatherCode')

  SUNRISE=$(echo "$WEATHER_JSON" | jq -r '.weather[0].astronomy[0].sunrise')
  SUNSET=$(echo "$WEATHER_JSON" | jq -r '.weather[0].astronomy[0].sunset')

  CURRENT_HOUR=$(date +%H)
  CURRENT_MIN=$(date +%M)
  CURRENT_TIME=$((10#$CURRENT_HOUR * 60 + 10#$CURRENT_MIN))

  SUNRISE_HOUR=$(echo "$SUNRISE" | awk '{print $1}' | sed 's/:/ /')
  SUNRISE_AMPM=$(echo "$SUNRISE" | awk '{print $2}')
  SUNRISE_H=$(echo "$SUNRISE_HOUR" | awk '{print $1}')
  SUNRISE_M=$(echo "$SUNRISE_HOUR" | awk '{print $2}')
  [ "$SUNRISE_AMPM" = "PM" ] && [ "$SUNRISE_H" != "12" ] && SUNRISE_H=$((10#$SUNRISE_H + 12))
  [ "$SUNRISE_AMPM" = "AM" ] && [ "$SUNRISE_H" = "12" ] && SUNRISE_H=0
  SUNRISE_TIME=$((10#$SUNRISE_H * 60 + 10#$SUNRISE_M))

  SUNSET_HOUR=$(echo "$SUNSET" | awk '{print $1}' | sed 's/:/ /')
  SUNSET_AMPM=$(echo "$SUNSET" | awk '{print $2}')
  SUNSET_H=$(echo "$SUNSET_HOUR" | awk '{print $1}')
  SUNSET_M=$(echo "$SUNSET_HOUR" | awk '{print $2}')
  [ "$SUNSET_AMPM" = "PM" ] && [ "$SUNSET_H" != "12" ] && SUNSET_H=$((10#$SUNSET_H + 12))
  [ "$SUNSET_AMPM" = "AM" ] && [ "$SUNSET_H" = "12" ] && SUNSET_H=0
  SUNSET_TIME=$((10#$SUNSET_H * 60 + 10#$SUNSET_M))

  if [ "$CURRENT_TIME" -ge "$SUNRISE_TIME" ] && [ "$CURRENT_TIME" -lt "$SUNSET_TIME" ]; then
    IS_DAY=1
  else
    IS_DAY=0
  fi
fi

ICON=$(get_weather_icon "$WEATHER_CODE" "$IS_DAY")

sketchybar --set weather.icon icon="$ICON"
sketchybar --set weather.label label="${TEMP}°C"
