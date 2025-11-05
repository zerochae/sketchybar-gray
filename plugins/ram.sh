#!/usr/bin/env bash

source "$CONFIG_DIR/tokens/colors.sh"
source "$CONFIG_DIR/plugins/helpers.sh"

total_mem_bytes=$(sysctl -n hw.memsize)
page_size=$(sysctl -n vm.pagesize)

read -r active_pages wired_pages <<EOF
   $(vm_stat | awk '
        /Pages active/     {active=$3}
        /Pages wired/      {wired=$4}
        END {print active, wired}' | tr -d '.')
EOF

used_mem_bytes=$(((active_pages + wired_pages) * page_size))

if [ "$total_mem_bytes" -gt 0 ]; then
  used_mem_percentage=$((used_mem_bytes * 100 / total_mem_bytes))
  if [ $used_mem_percentage -lt 0 ]; then
    used_mem_percentage=0
  elif [ $used_mem_percentage -gt 100 ]; then
    used_mem_percentage=100
  fi
else
  used_mem_percentage=0
fi

if [ "$SBAR_RAM_SHOW_GRAPH" = true ]; then
  LOAD_NORMALIZED=$(calc "sprintf(\"%.2f\", $used_mem_percentage / 100)")
  sketchybar --push ram.graph "$LOAD_NORMALIZED" \
             --set ram.graph graph.color="$COLOR_MAGENTA_75" graph.fill_color="$COLOR_BLACK_25" label="${used_mem_percentage}%"
elif [ "$SBAR_RAM_SHOW_PERCENT" = true ]; then
  sketchybar --set ram.percent label="${used_mem_percentage}%"
fi
