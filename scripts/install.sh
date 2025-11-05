#!/usr/bin/env bash

set -e

REPO_URL="https://github.com/zerochae/sketchybar-gray"
CONFIG_DIR="$HOME/.config/sketchybar"

echo ""
echo "=========================================="
echo "  Sketchybar Gray - Installation"
echo "=========================================="
echo ""

if ! command -v brew &> /dev/null; then
    echo "[ERROR] Homebrew is not installed."
    echo ""
    echo "Please install Homebrew first:"
    echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

echo "The following dependencies will be installed:"
echo ""
echo "  Required:"
echo "    - sketchybar"
echo "    - jq"
echo "    - pnpm"
echo "    - font-space-mono-nerd-font"
echo "    - sketchybar-app-font (from GitHub)"
echo ""
echo "  Optional:"
echo "    - yabai (window manager for workspace features)"
echo ""
read -p "Continue with installation? [Y/n]: " -n 1 -r REPLY < /dev/tty
echo ""
if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo "Installation cancelled."
    exit 0
fi
echo ""

echo "[1/6] Installing required packages..."
echo "----------------------------------------"
brew tap FelixKratz/formulae 2>&1 | grep -v "already tapped" || true
brew install sketchybar jq 2>&1 | grep -v "already installed" || true
brew install --cask font-space-mono-nerd-font 2>&1 | grep -v "already installed" || true
echo ""

echo "[2/6] Installing yabai (optional)..."
echo "----------------------------------------"
read -p "Install yabai? (enables workspace features) [y/N]: " -n 1 -r REPLY < /dev/tty
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew install koekeishiya/formulae/yabai
    brew services start yabai
fi
echo ""

echo "[3/6] Downloading configuration files..."
echo "----------------------------------------"
if [ -d "$CONFIG_DIR" ]; then
    BACKUP_DIR="${CONFIG_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
    echo "Backing up existing config: $BACKUP_DIR"
    mv "$CONFIG_DIR" "$BACKUP_DIR"
fi
git clone "$REPO_URL" "$CONFIG_DIR"
echo ""

echo "[4/6] Installing sketchybar-app-font..."
echo "----------------------------------------"
if ! command -v pnpm &> /dev/null; then
    echo "Installing pnpm..."
    brew install pnpm
fi

TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"
git clone https://github.com/kvndrsslr/sketchybar-app-font.git > /dev/null 2>&1
cd sketchybar-app-font

pnpm install > /dev/null 2>&1
pnpm run build:install > /dev/null 2>&1

mkdir -p "$CONFIG_DIR/icons"
cp dist/icon_map.sh "$CONFIG_DIR/icons/apps.sh"
cp dist/sketchybar-app-font.ttf "$HOME/Library/Fonts/"
echo "Done"

cd ~
rm -rf "$TEMP_DIR"
echo ""

echo "[5/6] Refreshing font cache..."
echo "----------------------------------------"
fc-cache -f -v > /dev/null 2>&1
echo "Done"
echo ""

echo "[6/6] Starting Sketchybar..."
echo "----------------------------------------"
brew services restart sketchybar
echo ""

echo "=========================================="
echo "  Installation Complete!"
echo "=========================================="
echo ""
echo "Customization:"
echo "  - Config file: $CONFIG_DIR/sketchybarrc"
echo "  - Weather location: SBAR_WEATHER_LOCATION"
echo "  - Icon size: SBAR_APP_ICON_FONT_SIZE"
echo ""
echo "Commands:"
echo "  - brew services start sketchybar    # Start"
echo "  - brew services restart sketchybar  # Restart"
echo "  - brew services stop sketchybar     # Stop"
echo "  - sketchybar --reload               # Reload config"
echo ""
echo "Documentation: $CONFIG_DIR/README.md"
echo ""
