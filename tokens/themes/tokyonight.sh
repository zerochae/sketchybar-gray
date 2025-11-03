#!/usr/bin/env bash

# Tokyo Night Theme
# https://github.com/folke/tokyonight.nvim

source "$CONFIG_DIR/tokens/helpers.sh"

export COLOR_WHITE="0xFFa9b1d6"
export COLOR_BLACK="0xFF1a1b26"
export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF787c99"
export COLOR_DARK_GRAY="0xFF292e42"

export COLOR_BG1="0xFF1a1b26"
export COLOR_BG2="0xFF16161e"

generate_alpha_variants "RED" "0xFFf7768e"
generate_alpha_variants "YELLOW" "0xFFe0af68"
generate_alpha_variants "BLUE" "0xFF7aa2f7"
generate_alpha_variants "GREEN" "0xFF9ece6a"
generate_alpha_variants "MAGENTA" "0xFFbb9af7"
generate_alpha_variants "CYAN" "0xFF7dcfff"
generate_alpha_variants "ORANGE" "0xFFff9e64"
generate_alpha_variants "TANGERINE" "0xFFff9e64"

export SBAR_DEFAULT_ICON_COLOR="$COLOR_WHITE"
export SBAR_DEFAULT_LABEL_COLOR="$COLOR_WHITE"
export SBAR_BAR_COLOR="$COLOR_TRANSPARENT"

export SBAR_COLOR_CLOCK="$COLOR_YELLOW"
export SBAR_COLOR_WEATHER="$COLOR_CYAN"
export SBAR_COLOR_CAFFEINATE="$COLOR_GREEN"
export SBAR_COLOR_VOLUME="$COLOR_BLUE"
export SBAR_COLOR_BATTERY="$COLOR_ORANGE"
export SBAR_COLOR_DISK="$COLOR_RED"
export SBAR_COLOR_RAM="$COLOR_MAGENTA"
export SBAR_COLOR_CPU="0xFF2ac3de"
export SBAR_COLOR_NETSTAT="$COLOR_TANGERINE"
export SBAR_COLOR_FRONT_APP="$COLOR_GREEN"
export SBAR_COLOR_SPACE="0xFF24283b"
export SBAR_COLOR_SPACE_BORDER="$COLOR_GREEN"
