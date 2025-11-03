#!/usr/bin/env bash

# Gruvbox Light Theme
# https://github.com/morhetz/gruvbox

source "$CONFIG_DIR/tokens/helpers.sh"

export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF928374"
export COLOR_DARK_GRAY="0xFFCABD94"

export COLOR_BG1="0xFFF2E5BC"
export COLOR_BG2="0xFFEBD9A3"

generate_alpha_variants "WHITE" "0xFF504945"
generate_alpha_variants "BLACK" "0xFF3c3836"
generate_alpha_variants "RED" "0xFF9d0006"
generate_alpha_variants "YELLOW" "0xFFb57614"
generate_alpha_variants "BLUE" "0xFF076678"
generate_alpha_variants "GREEN" "0xFF79740e"
generate_alpha_variants "MAGENTA" "0xFF8f3f71"
generate_alpha_variants "CYAN" "0xFF427b58"
generate_alpha_variants "ORANGE" "0xFFaf3a03"
generate_alpha_variants "TANGERINE" "0xFFd65d0e"

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
export SBAR_COLOR_SPACE="0xFFD8CBA2"
export SBAR_COLOR_SPACE_BORDER="$COLOR_GREEN"
