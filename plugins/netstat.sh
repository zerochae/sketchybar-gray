#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"

LOCK_DIR="/tmp/sketchybar_netstat.lock"

if ! mkdir "$LOCK_DIR" 2>/dev/null; then
  exit 0
fi

cleanup() {
  if [ -n "$netstat_pid" ]; then
    kill "$netstat_pid" 2>/dev/null
    wait "$netstat_pid" 2>/dev/null
  fi
  rmdir "$LOCK_DIR" 2>/dev/null
}

trap cleanup EXIT

get_speed_bar() {
  local speed=$1
  local direction=$2
  local max_speed=409600

  local bars=(
    "$(get_icon_from_json "block-1" false)"
    "$(get_icon_from_json "block-2" false)"
    "$(get_icon_from_json "block-3" false)"
    "$(get_icon_from_json "block-4" false)"
    "$(get_icon_from_json "block-5" false)"
    "$(get_icon_from_json "block-6" false)"
    "$(get_icon_from_json "block-7" false)"
    "$(get_icon_from_json "block-8" false)"
  )

  local history_file="/tmp/sketchybar_netstat_${direction}"

  if [ ! -f "$history_file" ]; then
    echo "0 0 0 0 0" > "$history_file"
  fi

  read -r _ h2 h3 h4 h5 < "$history_file"

  local percentage=$((speed * 100 / max_speed))
  [ "$percentage" -gt 100 ] && percentage=100

  local height=$((percentage * 8 / 100))
  [ "$height" -gt 7 ] && height=7

  echo "$h2 $h3 $h4 $h5 $height" > "$history_file"

  local result=""
  for val in $h2 $h3 $h4 $h5 $height; do
    result="${result}${bars[$val]}"
  done

  echo "$result"
}

tmp_file="/tmp/sketchybar_netstat.out"

netstat -w1 > "$tmp_file" 2>&1 &
netstat_pid=$!

sleep 1.5

if kill -0 "$netstat_pid" 2>/dev/null; then
  kill "$netstat_pid" 2>/dev/null
  sleep 0.1
  if kill -0 "$netstat_pid" 2>/dev/null; then
    kill -9 "$netstat_pid" 2>/dev/null
  fi
fi
wait "$netstat_pid" 2>/dev/null

netstat_output=$(grep '[0-9]' "$tmp_file" | tail -1)

speed_in=$(echo "$netstat_output" | awk '{print $3}')
speed_out=$(echo "$netstat_output" | awk '{print $6}')

[ -z "$speed_in" ] && speed_in=0
[ -z "$speed_out" ] && speed_out=0

format_speed() {
  local speed=$1
  local val

  if [ "$speed" -gt 1073741824 ]; then
    val=$((speed / 1073741824))
    [ "$val" -gt 999 ] && val=999
    echo "${val}G"
  elif [ "$speed" -gt 1048576 ]; then
    val=$((speed / 1048576))
    [ "$val" -gt 999 ] && val=999
    echo "${val}M"
  elif [ "$speed" -gt 1024 ]; then
    val=$((speed / 1024))
    [ "$val" -gt 999 ] && val=999
    echo "${val}K"
  else
    val=$speed
    [ "$val" -gt 999 ] && val=999
    echo "${val}B"
  fi
}

down_speed=$(format_speed "$speed_in")
up_speed=$(format_speed "$speed_out")

down_label=""
up_label=""

if [ "$SBAR_NETSTAT_SHOW_SPEED" = true ]; then
  down_label="$down_speed"
  up_label="$up_speed"
fi

if [ "$SBAR_NETSTAT_SHOW_GRAPH" = true ]; then
  down_bar=$(get_speed_bar "$speed_in" "down")
  up_bar=$(get_speed_bar "$speed_out" "up")

  if [ "$SBAR_NETSTAT_SHOW_SPEED" = true ]; then
    down_label="$down_label $down_bar"
    up_label="$up_label $up_bar"
  else
    down_label="$down_bar"
    up_label="$up_bar"
  fi
fi

sketchybar --set netstat.down.label label="$down_label"
sketchybar --set netstat.up.label label="$up_label"
