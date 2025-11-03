
<img width="2048" height="71" alt="SCR-20251103-phlv" src="https://github.com/user-attachments/assets/4b806854-3ade-498f-9a55-733078355551" />

# Sketchybar Configuration

A customized macOS menu bar configuration featuring app icons, system status, weather, and more.

## Dependencies

### Required
- [Homebrew](https://brew.sh/) - Package manager for macOS
- [sketchybar](https://github.com/FelixKratz/SketchyBar) - Customizable status bar
- [jq](https://stedolan.github.io/jq/) - JSON processor
- [pnpm](https://pnpm.io/) - Package manager
- [Space Mono Nerd Font](https://www.nerdfonts.com/) - Font with icons
- [sketchybar-app-font](https://github.com/kvndrsslr/sketchybar-app-font) - App icon font

### Optional
- [yabai](https://github.com/koekeishiya/yabai) - Window manager (for workspace features)

## Installation

### Quick Install (Recommended)

Install with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/zerochae/sketchybar-gray/master/install.sh | bash
```

### Manual Installation

#### 1. Install Homebrew (if not installed)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### 2. Install Required Packages

```bash
brew install sketchybar jq
brew install --cask font-space-mono-nerd-font
```

#### 3. (Optional) Install Window Manager

For workspace/space features, install yabai:

```bash
brew install koekeishiya/formulae/yabai
brew services start yabai
```

#### 4. Clone Configuration

```bash
# Backup existing config (if any)
mv ~/.config/sketchybar ~/.config/sketchybar.backup

# Clone this configuration
git clone https://github.com/zerochae/sketchybar-gray ~/.config/sketchybar
```

#### 5. Install App Icon Font

```bash
cd /tmp
git clone https://github.com/kvndrsslr/sketchybar-app-font.git
cd sketchybar-app-font
pnpm install
pnpm run build:install
```

If you encounter errors:

```bash
mkdir -p ~/.config/sketchybar/icons
cp dist/icon_map.sh ~/.config/sketchybar/icons/apps.sh
cp dist/sketchybar-app-font.ttf ~/Library/Fonts/
```

#### 6. Start Sketchybar

```bash
brew services restart sketchybar
```

Done! You should now see the customized status bar at the top of your screen.

## Configuration

### Environment Variables

Customize settings in `sketchybarrc`:

```bash
# Font settings
export SBAR_FONT_FAMILY="SpaceMono Nerd Font Mono"
export SBAR_APP_ICON_FONT="sketchybar-app-font"
export SBAR_APP_ICON_FONT_SIZE="20.0"  # Adjust icon size

# Bar settings
export SBAR_BAR_HEIGHT=56
export SBAR_BAR_POSITION="top"  # top or bottom

# Update frequency
export SBAR_ITEM_UPDATE_FREQ_FAST=2    # Fast update interval (seconds)
export SBAR_ITEM_UPDATE_FREQ_DEFAULT=10
export SBAR_ITEM_UPDATE_FREQ_SLOW=30
```

### Enable/Disable Widgets

Edit the `SBAR_WIDGETS_*` arrays in `sketchybarrc`:

```bash
export SBAR_WIDGETS_RIGHT=(
  "clock"
  "weather"      # Remove this line to disable weather
  "caffeinate"
  "volume"
  "battery"
  "disk"
  "ram"
  "cpu"
  "netstat"
)
```

### Change Weather Location

In `sketchybarrc`:

```bash
export SBAR_WEATHER_LOCATION="Seoul"  # Change to your city
```

## Directory Structure

```
~/.config/sketchybar/
├── sketchybarrc           # Main configuration file (environment variables)
├── loader.sh              # Widget loader
├── README.md              # Documentation
├── icons/
│   ├── apps.sh            # App icon mappings (sketchybar-app-font)
│   └── system.json        # System icons (Nerd Fonts)
├── items/                 # Widget item definitions
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
├── plugins/               # Widget scripts
│   ├── helpers.sh         # Utility functions
│   ├── app_icon.sh        # Icon helper
│   ├── front_app.sh
│   ├── space.sh
│   ├── yabai.sh          # yabai integration
│   ├── mission_control.sh # Mission control fallback
│   └── ...
└── tokens/
    └── colors.sh          # Color definitions
```

## Troubleshooting

### Icons not displaying

1. Check font installation:
   ```bash
   fc-list | grep -i "space mono"
   fc-list | grep -i "sketchybar-app-font"
   ```

2. Restart Sketchybar:
   ```bash
   brew services restart sketchybar
   ```

### Apps not showing in spaces

Verify yabai is installed and running:
```bash
brew services list | grep yabai
yabai -m query --spaces
```

### Weather not displaying

Check internet connection and curl:
```bash
curl -s "wttr.in/Seoul?format=j1"
```

### Permission errors

Grant execute permissions to scripts:
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
