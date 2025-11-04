#!/usr/bin/env bash

# Ayu Dark Theme
# https://github.com/ayu-theme

source "$CONFIG_DIR/tokens/helpers.sh"

export THEME_TYPE="dark"

export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF626A73"
export COLOR_DARK_GRAY="0xFF33363c"

export COLOR_BG1="0xFF0B0E14"
export COLOR_BG2="0xFF11141a"

generate_alpha_variants "WHITE" "0xFFc9c7be"
generate_alpha_variants "BLACK" "0xFF01060E"
generate_alpha_variants "RED" "0xFFF07174"
generate_alpha_variants "YELLOW" "0xFFFFB454"
generate_alpha_variants "BLUE" "0xFF56c3f9"
generate_alpha_variants "GREEN" "0xFFAAD84C"
generate_alpha_variants "MAGENTA" "0xFFD2A6FF"
generate_alpha_variants "CYAN" "0xFF95E6CB"
generate_alpha_variants "ORANGE" "0xFFFFB454"
generate_alpha_variants "TANGERINE" "0xFFFFB454"

