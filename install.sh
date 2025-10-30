#!/usr/bin/env bash

set -e

REPO_URL="https://github.com/YOUR_USERNAME/sketchybar-config"
CONFIG_DIR="$HOME/.config/sketchybar"

echo "🚀 Sketchybar 설정 설치 시작..."

if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew가 설치되어 있지 않습니다."
    echo "📦 Homebrew를 먼저 설치하세요:"
    echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

echo "📦 필수 패키지 설치 중..."
brew install sketchybar jq 2>&1 | grep -v "already installed" || true
brew install --cask font-space-mono-nerd-font 2>&1 | grep -v "already installed" || true

echo "⚙️  yabai 설치 여부 확인..."
read -p "yabai를 설치하시겠습니까? (Space 기능 활성화) [y/N]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew install koekeishiya/formulae/yabai
    brew services start yabai
fi

if [ -d "$CONFIG_DIR" ]; then
    echo "⚠️  기존 설정이 있습니다."
    BACKUP_DIR="${CONFIG_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
    echo "📁 백업 생성 중: $BACKUP_DIR"
    mv "$CONFIG_DIR" "$BACKUP_DIR"
fi

echo "📥 설정 파일 다운로드 중..."
git clone "$REPO_URL" "$CONFIG_DIR"

echo "🎨 sketchybar-app-font 설치 중..."
if ! command -v pnpm &> /dev/null; then
    echo "📦 pnpm 설치 중..."
    brew install pnpm
fi

TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"
git clone https://github.com/kvndrsslr/sketchybar-app-font.git
cd sketchybar-app-font

pnpm install
pnpm run build:install 2>&1 || {
    echo "⚠️  자동 설치 실패, 수동으로 설치 중..."
    mkdir -p "$CONFIG_DIR/icons"
    cp dist/icon_map.sh "$CONFIG_DIR/icons/apps.sh"
    cp dist/sketchybar-app-font.ttf "$HOME/Library/Fonts/"
}

cd ~
rm -rf "$TEMP_DIR"

echo "🔄 폰트 캐시 새로고침 중..."
fc-cache -f -v > /dev/null 2>&1

echo "🚀 Sketchybar 시작 중..."
brew services restart sketchybar

echo ""
echo "✅ 설치 완료!"
echo ""
echo "📝 커스터마이징:"
echo "   설정 파일: $CONFIG_DIR/sketchybarrc"
echo "   날씨 위치: SBAR_WEATHER_LOCATION 환경변수 수정"
echo "   아이콘 크기: SBAR_APP_ICON_FONT_SIZE 환경변수 수정"
echo ""
echo "📚 자세한 내용: $CONFIG_DIR/README.md"
