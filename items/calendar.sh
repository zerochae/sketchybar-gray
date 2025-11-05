#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon.sh"

CALENDAR_ICON=$(get_widget_icon "calendar")

sketchybar --add item calendar.label right \
	--set calendar.label \
		label.color="$COLOR_BLACK" \
		label.padding_right="$SBAR_ITEM_LABEL_PADDING_RIGHT" \
		update_freq=10 \
		script="$SBAR_PLUGIN_DIR/calendar.sh"

sketchybar --add item calendar.icon right \
	--set calendar.icon \
		icon="$CALENDAR_ICON" \
		icon.font="$SBAR_ICON_FONT_FACE_BOLD:$SBAR_ICON_FONT_SIZE" \
		icon.color="$COLOR_BLACK" \
		icon.padding_left="$SBAR_ITEM_ICON_PADDING_LEFT" \
		icon.padding_right="$SBAR_ITEM_ICON_PADDING_RIGHT"

sketchybar --add bracket calendar calendar.label calendar.icon \
	--set calendar \
		background.color="$SBAR_COLOR_CALENDAR" \
		background.corner_radius="$SBAR_ITEM_BG_CORNER_RADIUS" \
		background.height="$SBAR_ITEM_BG_HEIGHT" \
		background.border_width="$SBAR_ITEM_BG_BORDER_WIDTH"
