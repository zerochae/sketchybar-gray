#!/usr/bin/env bash

# Nord Theme
# https://www.nordtheme.com/

source "$CONFIG_DIR/tokens/helpers.sh"

export THEME_TYPE="dark"

export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFFD8DEE9"
export COLOR_DARK_GRAY="0xFF4C566A"

export COLOR_BG1="0xFF2E3440"
export COLOR_BG2="0xFF3B4252"

generate_alpha_variants "WHITE" "0xFFE5E9F0"
generate_alpha_variants "BLACK" "0xFF2E3440"
generate_alpha_variants "RED" "0xFFBF616A"
generate_alpha_variants "YELLOW" "0xFFEBCB8B"
generate_alpha_variants "BLUE" "0xFF81A1C1"
generate_alpha_variants "GREEN" "0xFFA3BE8C"
generate_alpha_variants "MAGENTA" "0xFFB48EAD"
generate_alpha_variants "CYAN" "0xFF88C0D0"
generate_alpha_variants "ORANGE" "0xFFD08770"
generate_alpha_variants "TANGERINE" "0xFFD08770"

