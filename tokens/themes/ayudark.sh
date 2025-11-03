#!/usr/bin/env bash

# Ayu Dark Theme
# https://github.com/ayu-theme

source "$CONFIG_DIR/tokens/helpers.sh"

export COLOR_WHITE="0xFFc9c7be"
export COLOR_BLACK="0xFF0B0E14"
export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF626A73"
export COLOR_DARK_GRAY="0xFF33363c"

generate_alpha_variants "BG1" "0xFF0B0E14"
generate_alpha_variants "BG2" "0xFF11141a"

generate_alpha_variants "RED" "0xFFF07174"
generate_alpha_variants "YELLOW" "0xFFFFB454"
generate_alpha_variants "BLUE" "0xFF56c3f9"
generate_alpha_variants "GREEN" "0xFFAAD84C"
generate_alpha_variants "MAGENTA" "0xFFD2A6FF"
generate_alpha_variants "CYAN" "0xFF95E6CB"
generate_alpha_variants "ORANGE" "0xFFFFB454"
generate_alpha_variants "TANGERINE" "0xFFFFB454"

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
export SBAR_COLOR_CPU="0xFF59C2FF"
export SBAR_COLOR_NETSTAT="$COLOR_TANGERINE"
export SBAR_COLOR_FRONT_APP="$COLOR_GREEN"
export SBAR_COLOR_SPACE="0xFF1a1d23"
export SBAR_COLOR_SPACE_BORDER="$COLOR_GREEN"
