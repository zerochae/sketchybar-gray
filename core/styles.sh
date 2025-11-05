#!/usr/bin/env bash

case "$SBAR_BAR_STYLE" in
  "compact")
    source "$CONFIG_DIR/styles/compact.sh"
    ;;
  "block")
    source "$CONFIG_DIR/styles/block.sh"
    ;;
esac
