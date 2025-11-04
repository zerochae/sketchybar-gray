#!/usr/bin/env bash

TARGET_DIR="${1:-$HOME/.config/sketchybar}"

if [ -n "${BASH_SOURCE[0]}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  TARGET_DIR="$SCRIPT_DIR"
fi

if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory not found: $TARGET_DIR"
  exit 1
fi

cd "$TARGET_DIR" || exit 1

if [ ! -d ".git" ]; then
  echo "Error: Not a git repository"
  exit 1
fi

git fetch origin -q

BEHIND=$(git rev-list HEAD..origin/master --count 2>/dev/null)

if [ -z "$BEHIND" ] || [ "$BEHIND" -eq 0 ]; then
  echo "Already up to date"
  exit 0
fi

echo "Update available: ${BEHIND} commit(s)"

if git diff-index --quiet HEAD --; then
  if git pull origin master -q; then
    echo "Updated successfully"
    sketchybar --reload
  else
    echo "Update failed"
    exit 1
  fi
else
  echo "Local changes detected"
  echo "  1) Stash and update"
  echo "  2) Discard and update"
  echo "  3) Cancel"
  read -rp "Choose (1/2/3): " choice

  case $choice in
    1)
      git stash -q
      git pull origin master -q
      git stash pop -q
      echo "Updated successfully"
      sketchybar --reload
      ;;
    2)
      git reset --hard HEAD -q
      git pull origin master -q
      echo "Updated successfully"
      sketchybar --reload
      ;;
    3)
      echo "Cancelled"
      exit 0
      ;;
    *)
      echo "Invalid choice"
      exit 1
      ;;
  esac
fi
