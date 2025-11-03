#!/usr/bin/env bash

# GitHub Light Theme
# https://github.com/primer/github-vscode-theme

source "$CONFIG_DIR/tokens/helpers.sh"

export COLOR_WHITE="0xFF2e3338"
export COLOR_BLACK="0xFFffffff"
export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF8b949e"
export COLOR_DARK_GRAY="0xFFd7d9db"

generate_alpha_variants "BG1" "0xFFffffff"
generate_alpha_variants "BG2" "0xFFf6f8fa"

generate_alpha_variants "RED" "0xFF5a32a3"
generate_alpha_variants "YELLOW" "0xFFb08800"
generate_alpha_variants "BLUE" "0xFF005cc5"
generate_alpha_variants "GREEN" "0xFF4c2889"
generate_alpha_variants "MAGENTA" "0xFFDE2C2E"
generate_alpha_variants "CYAN" "0xFF8263EB"
generate_alpha_variants "ORANGE" "0xFFb93a86"
generate_alpha_variants "TANGERINE" "0xFFd4a72c"

export SBAR_DEFAULT_ICON_COLOR="$COLOR_WHITE"
export SBAR_DEFAULT_LABEL_COLOR="$COLOR_WHITE"
export SBAR_BAR_COLOR="$COLOR_TRANSPARENT"

export SBAR_COLOR_CLOCK="$COLOR_YELLOW1"
export SBAR_COLOR_WEATHER="$COLOR_CYAN1"
export SBAR_COLOR_CAFFEINATE="$COLOR_GREEN1"
export SBAR_COLOR_VOLUME="$COLOR_BLUE1"
export SBAR_COLOR_BATTERY="$COLOR_ORANGE1"
export SBAR_COLOR_DISK="$COLOR_RED1"
export SBAR_COLOR_RAM="$COLOR_MAGENTA1"
export SBAR_COLOR_CPU="$COLOR_BLUE1"
export SBAR_COLOR_NETSTAT="$COLOR_TANGERINE1"
export SBAR_COLOR_FRONT_APP="$COLOR_GREEN1"
export SBAR_COLOR_SPACE="0xFFeaeef2"
export SBAR_COLOR_SPACE_BORDER="$COLOR_GREEN1"
