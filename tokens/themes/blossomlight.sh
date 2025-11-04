#!/usr/bin/env bash

# Blossom Light Theme
# Custom light theme with soft, natural colors

source "$CONFIG_DIR/tokens/helpers.sh"

export THEME_TYPE="light"

export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF998b85"
export COLOR_DARK_GRAY="0xFFcac3c0"

export COLOR_BG1="0xFFe6dfdc"
export COLOR_BG2="0xFFd8d1ce"

generate_alpha_variants "WHITE" "0xFF746862"
generate_alpha_variants "BLACK" "0xFF5e524c"
generate_alpha_variants "RED" "0xFF8779a8"
generate_alpha_variants "YELLOW" "0xFF738199"
generate_alpha_variants "BLUE" "0xFFb3816a"
generate_alpha_variants "GREEN" "0xFF6c805c"
generate_alpha_variants "MAGENTA" "0xFF7e8e8e"
generate_alpha_variants "CYAN" "0xFF5e908e"
generate_alpha_variants "ORANGE" "0xFFa87678"
generate_alpha_variants "TANGERINE" "0xFF97615b"

