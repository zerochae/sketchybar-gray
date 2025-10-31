#!/usr/bin/env bash

SPACER_INDEX=1

load_widgets() {
  local widget_array=("$@")

  if [ "$SBAR_AUTO_INSERT_SPACER" = true ]; then
    for i in "${!widget_array[@]}"; do
      item="${widget_array[$i]}"
      widget_name="${item%% *}"
      widget_arg="${item#* }"
      [ "$widget_arg" = "$widget_name" ] && widget_arg=""
      source "$SBAR_ITEM_DIR/${widget_name}.sh" "${widget_arg}"

      if [ $((i + 1)) -lt ${#widget_array[@]} ]; then
        source "$SBAR_ITEM_DIR/spacer.sh" "$SPACER_INDEX"
        ((SPACER_INDEX++))
      fi
    done
  else
    for item in "${widget_array[@]}"; do
      widget_name="${item%% *}"
      widget_arg="${item#* }"
      [ "$widget_arg" = "$widget_name" ] && widget_arg=""
      source "$SBAR_ITEM_DIR/${widget_name}.sh" "${widget_arg}"
    done
  fi
}
