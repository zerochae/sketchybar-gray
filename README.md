# Sketchybar Configuration

macOS 상단 바를 커스터마이징하는 설정입니다. 앱 아이콘, 시스템 상태, 날씨 등을 표시합니다.

## Installation

### Option 1: 로컬 설치 스크립트 (권장)

```bash
cd ~/.config/sketchybar
./install.sh
```

### Option 2: 원격 설치 (GitHub 업로드 후)

다른 컴퓨터에서 빠르게 설치하거나 dotfiles로 관리하는 경우:

```bash
curl -fsSL https://raw.githubusercontent.com/zerochae/sketchybar-gray/master/install.sh | bash
```

### Option 3: 수동 설치

### 1. Homebrew 설치 (없는 경우)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. 필수 프로그램 설치

```bash
brew install sketchybar jq
brew install --cask font-space-mono-nerd-font
```

### 3. (선택) Window Manager 설치

Space 기능을 사용하려면 yabai를 설치하세요:

```bash
brew install koekeishiya/formulae/yabai
brew services start yabai
```

### 4. 설정 파일 복사

```bash
# 기존 설정 백업 (있는 경우)
mv ~/.config/sketchybar ~/.config/sketchybar.backup

# 이 설정 복사
cp -r /path/to/this/config ~/.config/sketchybar
```

### 5. 앱 아이콘 폰트 설치

```bash
cd /tmp
git clone https://github.com/kvndrsslr/sketchybar-app-font.git
cd sketchybar-app-font
pnpm install
pnpm run build:install
```

오류가 발생하면:

```bash
mkdir -p ~/.config/sketchybar/icons
cp dist/icon_map.sh ~/.config/sketchybar/icons/apps.sh
cp dist/sketchybar-app-font.ttf ~/Library/Fonts/
```

### 6. Sketchybar 시작

```bash
brew services start sketchybar
```

완료! 이제 상단 바에서 커스터마이징된 상태바를 확인할 수 있습니다.

## Configuration

### 환경변수 커스터마이징

`sketchybarrc` 파일에서 다양한 설정을 변경할 수 있습니다:

```bash
# 폰트 설정
export SBAR_FONT_FAMILY="SpaceMono Nerd Font Mono"
export SBAR_APP_ICON_FONT="sketchybar-app-font"
export SBAR_APP_ICON_FONT_SIZE="20.0"  # 아이콘 크기 조절

# 바 설정
export SBAR_BAR_HEIGHT=56
export SBAR_BAR_POSITION="top"  # top 또는 bottom

# 업데이트 주기
export SBAR_ITEM_UPDATE_FREQ_FAST=2    # 빠른 업데이트 (초)
export SBAR_ITEM_UPDATE_FREQ_DEFAULT=10
export SBAR_ITEM_UPDATE_FREQ_SLOW=30
```

### 위젯 활성화/비활성화

`sketchybarrc`에서 `SBAR_WIDGETS_*` 배열을 수정:

```bash
export SBAR_WIDGETS_RIGHT=(
  "clock"
  "weather"      # 제거하려면 이 줄을 삭제
  "caffeinate"
  "volume"
  "battery"
  "disk"
  "ram"
  "cpu"
  "netstat"
)
```

### 날씨 위치 변경

`sketchybarrc`:

```bash
export SBAR_WEATHER_LOCATION="Seoul"  # 원하는 도시로 변경
```

## Directory Structure

```
~/.config/sketchybar/
├── sketchybarrc           # 메인 설정 파일 (환경변수)
├── loader.sh              # 위젯 로더
├── README.md              # 문서
├── icons/
│   ├── apps.sh            # 앱 아이콘 매핑 (sketchybar-app-font)
│   └── system.json        # 시스템 아이콘 (Nerd Fonts)
├── items/                 # 위젯 아이템 정의
│   ├── space.sh
│   ├── front_app.sh
│   ├── clock.sh
│   ├── weather.sh
│   ├── cpu.sh
│   ├── ram.sh
│   ├── disk.sh
│   ├── battery.sh
│   ├── volume.sh
│   ├── caffeinate.sh
│   └── netstat.sh
├── plugins/               # 위젯 스크립트
│   ├── helpers.sh         # 유틸리티 함수
│   ├── app_icon.sh        # 아이콘 헬퍼
│   ├── front_app.sh
│   ├── space.sh
│   ├── yabai.sh          # yabai 통합
│   ├── mission_control.sh # mission control 대안
│   └── ...
└── tokens/
    └── colors.sh          # 색상 정의
```

## Troubleshooting

### 아이콘이 표시되지 않음

1. 폰트 설치 확인:
   ```bash
   fc-list | grep -i "space mono"
   fc-list | grep -i "sketchybar-app-font"
   ```

2. Sketchybar 재시작:
   ```bash
   brew services restart sketchybar
   ```

### Space에 앱이 표시되지 않음

yabai가 설치되고 실행 중인지 확인:
```bash
brew services list | grep yabai
yabai -m query --spaces
```

### 날씨가 표시되지 않음

인터넷 연결과 curl 작동 확인:
```bash
curl -s "wttr.in/Seoul?format=j1"
```

### Permission 오류

Sketchybar 스크립트에 실행 권한 부여:
```bash
chmod +x ~/.config/sketchybar/plugins/*.sh
chmod +x ~/.config/sketchybar/items/*.sh
```

## Credits

- [sketchybar](https://github.com/FelixKratz/SketchyBar) by FelixKratz
- [sketchybar-app-font](https://github.com/kvndrsslr/sketchybar-app-font) by kvndrsslr
- [Nerd Fonts](https://www.nerdfonts.com/)

## License

MIT
