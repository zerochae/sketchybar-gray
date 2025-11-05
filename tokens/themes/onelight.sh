#!/usr/bin/env bash

# One Light Theme
# https://github.com/joshdick/onedark.vim

source "${CONFIG_DIR:-$HOME/.config/sketchybar}/tokens/helpers.sh"

export THEME_TYPE="light"

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

