#!/usr/bin/env bash

# Ayu Light Theme
# https://github.com/ayu-theme

source "$CONFIG_DIR/tokens/helpers.sh"

export THEME_TYPE="light"

export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF828C99"
export COLOR_DARK_GRAY="0xFFd2d2d2"

export COLOR_BG1="0xFFfafafa"
export COLOR_BG2="0xFFf0f0f0"

generate_alpha_variants "WHITE" "0xFF5C6166"
generate_alpha_variants "BLACK" "0xFF1A1F29"
generate_alpha_variants "RED" "0xFFF07171"
generate_alpha_variants "YELLOW" "0xFFF2AE49"
generate_alpha_variants "BLUE" "0xFF55B4D4"
generate_alpha_variants "GREEN" "0xFF86B300"
generate_alpha_variants "MAGENTA" "0xFFA37ACC"
generate_alpha_variants "CYAN" "0xFF4CBF99"
generate_alpha_variants "ORANGE" "0xFFFA8D3E"
generate_alpha_variants "TANGERINE" "0xFFF2AE49"

