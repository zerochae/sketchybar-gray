#!/usr/bin/env bash

if [ -n "$SBAR_WIDGETS_LEFT_ENABLED" ]; then
  read -ra SBAR_WIDGETS_LEFT <<< "$SBAR_WIDGETS_LEFT_ENABLED"
else
  export SBAR_WIDGETS_LEFT=(
    "space"
  )
fi

if [ -n "$SBAR_WIDGETS_CENTER_ENABLED" ]; then
  read -ra SBAR_WIDGETS_CENTER <<< "$SBAR_WIDGETS_CENTER_ENABLED"
else
  export SBAR_WIDGETS_CENTER=(
    "front_app"
  )
fi

if [ -n "$SBAR_WIDGETS_RIGHT_ENABLED" ]; then
  read -ra SBAR_WIDGETS_RIGHT <<< "$SBAR_WIDGETS_RIGHT_ENABLED"

  if [[ " ${SBAR_WIDGETS_RIGHT[*]} " =~ " config " ]]; then
    export SBAR_CONFIG_VISIBLE="true"
  else
    export SBAR_CONFIG_VISIBLE="false"
    SBAR_WIDGETS_RIGHT+=("config")
  fi
else
  export SBAR_WIDGETS_RIGHT=(
    "clock"
    "weather"
    "caffeinate"
    "volume"
    "battery"
    "disk"
    "ram"
    "cpu"
    "kakaotalk"
    "config"
  )
  export SBAR_CONFIG_VISIBLE="true"
fi

export SBAR_AUTO_INSERT_SPACER=true
