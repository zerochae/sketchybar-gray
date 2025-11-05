#!/usr/bin/env bash

source "$CONFIG_DIR/core/env.sh"

format="${SBAR_CALENDAR_FORMAT:-YYYY-MM-DD}"

format="${format//YYYY/__Y4__}"
format="${format//yyyy/__Y4__}"
format="${format//YY/__Y2__}"
format="${format//yy/__Y2__}"
format="${format//dddd/__WF__}"
format="${format//ddd/__WS__}"
format="${format//MM/__MO__}"
format="${format//DD/__D__}"
format="${format//dd/__D__}"
format="${format//HH/__H24__}"
format="${format//hh/__H12__}"
format="${format//mm/__m__}"
format="${format//ss/__s__}"
format="${format//A/__AP__}"

format="${format//__Y4__/%Y}"
format="${format//__Y2__/%y}"
format="${format//__WF__/%A}"
format="${format//__WS__/%a}"
format="${format//__MO__/%m}"
format="${format//__D__/%d}"
format="${format//__H24__/%H}"
format="${format//__H12__/%I}"
format="${format//__m__/%M}"
format="${format//__s__/%S}"
format="${format//__AP__/%p}"

sketchybar --set calendar.label label="$(date +"$format")"
