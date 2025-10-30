#!/usr/bin/env bash

total_mem_bytes=$(sysctl -n hw.memsize)
page_size=$(sysctl -n vm.pagesize)

read -r free_pages inactive_pages speculative_pages <<EOF
   $(vm_stat | awk '
        /Pages free/       {free=$3}
        /Pages inactive/   {inactive=$3}
        /Pages speculative/{speculative=$3}
        END {print free, inactive, speculative}' | tr -d '.')
EOF

non_active_pages=$((free_pages + inactive_pages + speculative_pages))
non_active_mem_bytes=$((non_active_pages * page_size))
used_mem_bytes=$((total_mem_bytes - non_active_mem_bytes))

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

sketchybar --set ram.percent label="${used_mem_percentage}%"
