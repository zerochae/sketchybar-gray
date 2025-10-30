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
    echo "[ERROR] Homebrew가 설치되어 있지 않습니다."
    echo ""
    echo "다음 명령으로 Homebrew를 먼저 설치하세요:"
    echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

echo "[1/6] 필수 패키지 설치 중..."
echo "----------------------------------------"
brew install sketchybar jq 2>&1 | grep -v "already installed" || true
brew install --cask font-space-mono-nerd-font 2>&1 | grep -v "already installed" || true
echo ""

echo "[2/6] yabai 설치 확인..."
echo "----------------------------------------"
read -p "yabai를 설치하시겠습니까? (Space 기능 활성화) [y/N]: " -n 1 -r REPLY < /dev/tty
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew install koekeishiya/formulae/yabai
    brew services start yabai
fi
echo ""

echo "[3/6] 설정 파일 다운로드..."
echo "----------------------------------------"
if [ -d "$CONFIG_DIR" ]; then
    BACKUP_DIR="${CONFIG_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
    echo "기존 설정 백업: $BACKUP_DIR"
    mv "$CONFIG_DIR" "$BACKUP_DIR"
fi
git clone "$REPO_URL" "$CONFIG_DIR"
echo ""

echo "[4/6] sketchybar-app-font 설치..."
echo "----------------------------------------"
if ! command -v pnpm &> /dev/null; then
    echo "pnpm 설치 중..."
    brew install pnpm
fi

TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"
git clone https://github.com/kvndrsslr/sketchybar-app-font.git
cd sketchybar-app-font

pnpm install
pnpm run build:install 2>&1 || {
    echo "자동 설치 실패, 수동으로 설치 중..."
    mkdir -p "$CONFIG_DIR/icons"
    cp dist/icon_map.sh "$CONFIG_DIR/icons/apps.sh"
    cp dist/sketchybar-app-font.ttf "$HOME/Library/Fonts/"
}

cd ~
rm -rf "$TEMP_DIR"
echo ""

echo "[5/6] 폰트 캐시 새로고침..."
echo "----------------------------------------"
fc-cache -f -v > /dev/null 2>&1
echo "완료"
echo ""

echo "[6/6] Sketchybar 시작..."
echo "----------------------------------------"
brew services restart sketchybar
echo ""

echo "=========================================="
echo "  설치 완료!"
echo "=========================================="
echo ""
echo "커스터마이징:"
echo "  - 설정 파일: $CONFIG_DIR/sketchybarrc"
echo "  - 날씨 위치: SBAR_WEATHER_LOCATION"
echo "  - 아이콘 크기: SBAR_APP_ICON_FONT_SIZE"
echo ""
echo "자세한 내용: $CONFIG_DIR/README.md"
echo ""
