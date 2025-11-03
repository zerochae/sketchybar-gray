#!/usr/bin/env bash

# One Dark Theme
# https://github.com/joshdick/onedark.vim

source "$CONFIG_DIR/tokens/helpers.sh"

export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF9ba2af"
export COLOR_DARK_GRAY="0xFF565c64"

export COLOR_BG1="0xFF1a1a26"
export COLOR_BG2="0xFF1F1F2B"

generate_alpha_variants "WHITE" "0xFFabb2bf"
generate_alpha_variants "BLACK" "0xFF282c34"
generate_alpha_variants "RED" "0xFFE06C75"
generate_alpha_variants "YELLOW" "0xFFe5c07b"
generate_alpha_variants "BLUE" "0xFF61afef"
generate_alpha_variants "GREEN" "0xFF98c379"
generate_alpha_variants "MAGENTA" "0xFFc678dd"
generate_alpha_variants "CYAN" "0xFF56b6c2"
generate_alpha_variants "ORANGE" "0xFFd19a66"
generate_alpha_variants "TANGERINE" "0xFFff9e64"

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
export SBAR_COLOR_SPACE="0xFF24242f"
export SBAR_COLOR_SPACE_BORDER="$COLOR_GREEN"
