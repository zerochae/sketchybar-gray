#!/usr/bin/env bash

NAME=$1

if [ -z "$NAME" ]; then
  return 1
fi

sketchybar --add item "spacer_$NAME" right \
  --set "spacer_$NAME" width=8
