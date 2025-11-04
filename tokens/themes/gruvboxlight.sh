#!/usr/bin/env bash

# Gruvbox Light Theme
# https://github.com/morhetz/gruvbox

source "$CONFIG_DIR/tokens/helpers.sh"

export THEME_TYPE="light"

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

