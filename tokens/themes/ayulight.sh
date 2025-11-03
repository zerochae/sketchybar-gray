#!/usr/bin/env bash

# Ayu Light Theme
# https://github.com/ayu-theme

source "$CONFIG_DIR/tokens/helpers.sh"

export COLOR_WHITE="0xFF1A1F29"
export COLOR_BLACK="0xFFfafafa"
export COLOR_TRANSPARENT="0x00ffffff"
export COLOR_LIGHT_GRAY="0xFF828C99"
export COLOR_DARK_GRAY="0xFFd2d2d2"

generate_alpha_variants "BG1" "0xFFfafafa"
generate_alpha_variants "BG2" "0xFFf0f0f0"

generate_alpha_variants "RED" "0xFFF07171"
generate_alpha_variants "YELLOW" "0xFFF2AE49"
generate_alpha_variants "BLUE" "0xFF55B4D4"
generate_alpha_variants "GREEN" "0xFF86B300"
generate_alpha_variants "MAGENTA" "0xFFA37ACC"
generate_alpha_variants "CYAN" "0xFF4CBF99"
generate_alpha_variants "ORANGE" "0xFFFA8D3E"
generate_alpha_variants "TANGERINE" "0xFFF2AE49"

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
export SBAR_COLOR_CPU="0xFF399EE6"
export SBAR_COLOR_NETSTAT="$COLOR_TANGERINE1"
export SBAR_COLOR_FRONT_APP="$COLOR_GREEN1"
export SBAR_COLOR_SPACE="0xFFe7e8e9"
export SBAR_COLOR_SPACE_BORDER="$COLOR_GREEN1"
