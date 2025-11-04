#!/usr/bin/env bash

# GitHub Light Theme
# https://github.com/primer/github-vscode-theme

source "$CONFIG_DIR/tokens/helpers.sh"

export THEME_TYPE="light"

export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF8b949e"
export COLOR_DARK_GRAY="0xFFd7d9db"

export COLOR_BG1="0xFFffffff"
export COLOR_BG2="0xFFf6f8fa"

generate_alpha_variants "WHITE" "0xFF383d42"
generate_alpha_variants "BLACK" "0xFF2e3338"
generate_alpha_variants "RED" "0xFF5a32a3"
generate_alpha_variants "YELLOW" "0xFFb08800"
generate_alpha_variants "BLUE" "0xFF005cc5"
generate_alpha_variants "GREEN" "0xFF4c2889"
generate_alpha_variants "MAGENTA" "0xFFDE2C2E"
generate_alpha_variants "CYAN" "0xFF8263EB"
generate_alpha_variants "ORANGE" "0xFFb93a86"
generate_alpha_variants "TANGERINE" "0xFFd4a72c"

