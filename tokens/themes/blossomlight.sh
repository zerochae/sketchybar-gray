#!/usr/bin/env bash

# Blossom Light Theme
# Custom light theme with soft, natural colors

source "$CONFIG_DIR/tokens/helpers.sh"

export COLOR_WHITE="0xFF5e524c"
export COLOR_BLACK="0xFFe6dfdc"
export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF998b85"
export COLOR_DARK_GRAY="0xFFcac3c0"

generate_alpha_variants "BG1" "0xFFe6dfdc"
generate_alpha_variants "BG2" "0xFFd8d1ce"

generate_alpha_variants "RED" "0xFF8779a8"
generate_alpha_variants "YELLOW" "0xFF738199"
generate_alpha_variants "BLUE" "0xFFb3816a"
generate_alpha_variants "GREEN" "0xFF6c805c"
generate_alpha_variants "MAGENTA" "0xFF7e8e8e"
generate_alpha_variants "CYAN" "0xFF5e908e"
generate_alpha_variants "ORANGE" "0xFFa87678"
generate_alpha_variants "TANGERINE" "0xFF97615b"

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
export SBAR_COLOR_SPACE="0xFFd1cac7"
export SBAR_COLOR_SPACE_BORDER="$COLOR_GREEN"
