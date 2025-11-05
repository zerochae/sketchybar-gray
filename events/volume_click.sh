#!/usr/bin/env bash

osascript -e "set volume output muted not (output muted of (get volume settings))"
sketchybar --trigger volume_change
