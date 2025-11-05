#!/usr/bin/env bash

# Color helper functions

# Generate alpha variants of a color
# Usage: generate_alpha_variants "BG1" "0xFFE06C75"
# Exports: COLOR_BG1, COLOR_BG1_75, COLOR_BG1_50, COLOR_BG1_25
generate_alpha_variants() {
  local name=$1
  local color=$2

  # Extract RGB from 0xFFRRGGBB
  local rgb="${color:4}"

  # Export all alpha variants using eval to handle variable names properly
  eval "export COLOR_${name}='0xFF${rgb}'"    # 100%
  eval "export COLOR_${name}_75='0xBF${rgb}'" # 75%
  eval "export COLOR_${name}_50='0x80${rgb}'" # 50%
  eval "export COLOR_${name}_25='0x40${rgb}'" # 25%
}

get_badge_label_color() {
  if [ "$THEME_TYPE" = "light" ]; then
    echo "$COLOR_WHITE"
  else
    echo "$COLOR_BLACK"
  fi
}
