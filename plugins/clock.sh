#!/usr/bin/env bash

if [ -z "$SBAR_CLOCK_FORMAT" ]; then
  SBAR_CLOCK_FORMAT=$(grep "^export SBAR_CLOCK_FORMAT=" "$CONFIG_DIR/sketchybarrc" | sed 's/^export SBAR_CLOCK_FORMAT="\(.*\)"/\1/')
fi

format="${SBAR_CLOCK_FORMAT:-DD/MM HH:mm}"

format="${format//YYYY/__Y4__}"
format="${format//YY/__Y2__}"
format="${format//MM/__MO__}"
format="${format//DD/__D__}"
format="${format//HH/__H24__}"
format="${format//hh/__H12__}"
format="${format//mm/__m__}"
format="${format//ss/__s__}"
format="${format//A/__AP__}"

format="${format//__Y4__/%Y}"
format="${format//__Y2__/%y}"
format="${format//__MO__/%m}"
format="${format//__D__/%d}"
format="${format//__H24__/%H}"
format="${format//__H12__/%I}"
format="${format//__m__/%M}"
format="${format//__s__/%S}"
format="${format//__AP__/%p}"

sketchybar --set clock.label label="$(date +"$format")"
