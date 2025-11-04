#!/usr/bin/env bash

# Tokyo Night Theme
# https://github.com/folke/tokyonight.nvim

source "$CONFIG_DIR/tokens/helpers.sh"

export THEME_TYPE="dark"

export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF787c99"
export COLOR_DARK_GRAY="0xFF292e42"

export COLOR_BG1="0xFF1a1b26"
export COLOR_BG2="0xFF16161e"

generate_alpha_variants "WHITE" "0xFFa9b1d6"
generate_alpha_variants "BLACK" "0xFF16161e"
generate_alpha_variants "RED" "0xFFf7768e"
generate_alpha_variants "YELLOW" "0xFFe0af68"
generate_alpha_variants "BLUE" "0xFF7aa2f7"
generate_alpha_variants "GREEN" "0xFF9ece6a"
generate_alpha_variants "MAGENTA" "0xFFbb9af7"
generate_alpha_variants "CYAN" "0xFF7dcfff"
generate_alpha_variants "ORANGE" "0xFFff9e64"
generate_alpha_variants "TANGERINE" "0xFFff9e64"

