#!/usr/bin/env bash

# GitHub Dark Theme
# https://github.com/primer/github-vscode-theme

source "$CONFIG_DIR/tokens/helpers.sh"

export THEME_TYPE="dark"

export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF768390"
export COLOR_DARK_GRAY="0xFF42474c"

export COLOR_BG1="0xFF24292E"
export COLOR_BG2="0xFF2d333b"

generate_alpha_variants "WHITE" "0xFFc9d1d9"
generate_alpha_variants "BLACK" "0xFF0d1117"
generate_alpha_variants "RED" "0xFFff7f8d"
generate_alpha_variants "YELLOW" "0xFFffdf5d"
generate_alpha_variants "BLUE" "0xFF6AB1F0"
generate_alpha_variants "GREEN" "0xFFa5d6ff"
generate_alpha_variants "MAGENTA" "0xFFB392E9"
generate_alpha_variants "CYAN" "0xFF83caff"
generate_alpha_variants "ORANGE" "0xFFffab70"
generate_alpha_variants "TANGERINE" "0xFFffab70"

