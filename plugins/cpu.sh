#!/usr/bin/env bash

source "$CONFIG_DIR/tokens/colors.sh"

TOPPROC=$(top -l 2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5 }' | cut -d "." -f1)

if [ "$SBAR_CPU_SHOW_GRAPH" = true ]; then
  LOAD_NORMALIZED=$(echo "scale=4; $TOPPROC / 100" | bc)
  sketchybar --push cpu.graph "$LOAD_NORMALIZED" \
             --set cpu.graph graph.color="$COLOR_BLUE_75" graph.fill_color="$COLOR_BLACK_25" label="${TOPPROC}%"
elif [ "$SBAR_CPU_SHOW_PERCENT" = true ]; then
  sketchybar --set cpu.percent label="${TOPPROC}%"
fi
