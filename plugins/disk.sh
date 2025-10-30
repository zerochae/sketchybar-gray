#!/usr/bin/env bash

USAGE_PERCENTAGE=$(df -k / | awk 'NR==2{printf "%d%%", int(($2 - $4) / $2 * 100)}')

sketchybar --set disk.percent label="$USAGE_PERCENTAGE"
