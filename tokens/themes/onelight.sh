#!/usr/bin/env bash

# One Light Theme
# https://github.com/joshdick/onedark.vim

source "$CONFIG_DIR/tokens/helpers.sh"

export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF9d9fa3"
export COLOR_DARK_GRAY="0xFFd7d7d8"

export COLOR_BG1="0xFFfafafa"
export COLOR_BG2="0xFFf0f0f0"

generate_alpha_variants "WHITE" "0xFF383a42"
generate_alpha_variants "BLACK" "0xFF202227"
generate_alpha_variants "RED" "0xFFd84a3d"
generate_alpha_variants "YELLOW" "0xFFc18401"
generate_alpha_variants "BLUE" "0xFF4078f2"
generate_alpha_variants "GREEN" "0xFF50a14f"
generate_alpha_variants "MAGENTA" "0xFFa626a4"
generate_alpha_variants "CYAN" "0xFF0070a8"
generate_alpha_variants "ORANGE" "0xFFd75f00"
generate_alpha_variants "TANGERINE" "0xFFdd8500"

export SBAR_DEFAULT_ICON_COLOR="$COLOR_WHITE"
export SBAR_DEFAULT_LABEL_COLOR="$COLOR_WHITE"
export SBAR_BAR_COLOR="$COLOR_TRANSPARENT"

export SBAR_COLOR_CLOCK="$COLOR_YELLOW"
export SBAR_COLOR_WEATHER="$COLOR_CYAN"
export SBAR_COLOR_CAFFEINATE="$COLOR_GREEN"
export SBAR_COLOR_VOLUME="$COLOR_BLUE"
export SBAR_COLOR_BATTERY="$COLOR_ORANGE"
export SBAR_COLOR_DISK="$COLOR_RED"
export SBAR_COLOR_RAM="$COLOR_MAGENTA"
export SBAR_COLOR_CPU="$COLOR_BLUE"
export SBAR_COLOR_NETSTAT="$COLOR_TANGERINE"
export SBAR_COLOR_FRONT_APP="$COLOR_GREEN"
export SBAR_COLOR_SPACE="0xFFe5e5e5"
export SBAR_COLOR_SPACE_BORDER="$COLOR_GREEN"
