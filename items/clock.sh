#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/app_icon.sh"

CLOCK_ICON=$(get_system_icon "clock")

sketchybar --add item clock.label right \
	--set clock.label \
		label.color="$COLOR_BLACK" \
		label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
		update_freq="$SBAR_ITEM_UPDATE_FREQ_DEFAULT" \
		script="$SBAR_PLUGIN_DIR/clock.sh"

sketchybar --add item clock.icon right \
	--set clock.icon \
		icon="$CLOCK_ICON" \
		icon.font="$SBAR_FONT_FACE_BOLD:$SBAR_ICON_FONT_SIZE" \
		icon.color="$COLOR_BLACK" \
		icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
		icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

sketchybar --add bracket clock clock.label clock.icon \
	--set clock \
		background.color="$SBAR_COLOR_CLOCK" \
		background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
		background.height="$SBAR_ITEM_BG_HEIGHT" \
		background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH"
