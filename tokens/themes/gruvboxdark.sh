#!/usr/bin/env bash

# Gruvbox Dark Theme
# https://github.com/morhetz/gruvbox

source "$CONFIG_DIR/tokens/helpers.sh"

export THEME_TYPE="dark"

export COLOR_TRANSPARENT="0x00000000"
export COLOR_LIGHT_GRAY="0xFF928374"
export COLOR_DARK_GRAY="0xFF484442"

export COLOR_BG1="0xFF282828"
export COLOR_BG2="0xFF3c3836"

generate_alpha_variants "WHITE" "0xFFebdbb2"
generate_alpha_variants "BLACK" "0xFF282828"
generate_alpha_variants "RED" "0xFFfb4934"
generate_alpha_variants "YELLOW" "0xFFfabd2f"
generate_alpha_variants "BLUE" "0xFF83a598"
generate_alpha_variants "GREEN" "0xFFb8bb26"
generate_alpha_variants "MAGENTA" "0xFFd3869b"
generate_alpha_variants "CYAN" "0xFF8ec07c"
generate_alpha_variants "ORANGE" "0xFFfe8019"
generate_alpha_variants "TANGERINE" "0xFFd65d0e"
