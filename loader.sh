#!/usr/bin/env bash
# shellcheck disable=SC1090,SC1091

SPACER_INDEX=1

load_widgets() {
  local -n widget_array=$1

  if [ "$SBAR_AUTO_INSERT_SPACER" = true ]; then
    for i in "${!widget_array[@]}"; do
      item="${widget_array[$i]}"
      # shellcheck disable=SC2086
      set -- $item
      source "$SBAR_ITEM_DIR/${1}.sh" "${2:-}"

      if [ $((i + 1)) -lt ${#widget_array[@]} ]; then
        source "$SBAR_ITEM_DIR/spacer.sh" "$SPACER_INDEX"
        ((SPACER_INDEX++))
      fi
    done
  else
    for item in "${widget_array[@]}"; do
      # shellcheck disable=SC2086
      set -- $item
      source "$SBAR_ITEM_DIR/${1}.sh" "${2:-}"
    done
  fi
}
