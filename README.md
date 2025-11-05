
<img width="2304" height="1296" alt="스크린샷 2025-11-04 17 23 49" src="https://github.com/user-attachments/assets/e5261c54-6243-4e9c-9610-eaf105cfd28e" />


# Sketchybar Gray

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
curl -fsSL https://raw.githubusercontent.com/zerochae/sketchybar-gray/master/scripts/install.sh | bash
```

### Manual Installation

#### 1. Install Homebrew (if not installed)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### 2. Install Required Packages

```bash
brew tap FelixKratz/formulae
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

## Update

### Quick Update (Recommended)

Update to the latest version with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/zerochae/sketchybar-gray/master/scripts/update.sh | bash
```

Or specify a custom directory:

```bash
curl -fsSL https://raw.githubusercontent.com/zerochae/sketchybar-gray/master/scripts/update.sh | bash -s /path/to/sketchybar
```

### Manual Update

Navigate to your sketchybar config directory and run the update script:

```bash
cd ~/.config/sketchybar
./scripts/update.sh
```

Or specify a custom directory:

```bash
./scripts/update.sh /path/to/sketchybar
```

Or use git directly:

```bash
cd ~/.config/sketchybar
git pull origin master
brew services restart sketchybar
```

## Configuration

### User Configuration

Create a user config file to override defaults:

```bash
# Create user config
touch ~/.config/sketchybar/user.sketchybarrc
```

Edit `user.sketchybarrc` to customize settings:

```bash
# Theme
export SBAR_THEME="onedark"  # or "onelight"

# Bar Style
export SBAR_BAR_STYLE="block"  # or "compact"

# Font settings
export SBAR_LABEL_FONT_FAMILY="SpaceMono Nerd Font Mono"
export SBAR_ICON_FONT_SIZE="18.0"
export SBAR_LABEL_FONT_SIZE="12.0"
export SBAR_APP_ICON_FONT_SIZE="13.5"

# Bar settings
export SBAR_BAR_HEIGHT=56
export SBAR_BAR_POSITION="top"  # top or bottom
export SBAR_BAR_BACKGROUND="transparent"  # or "bg1"

# Update frequency
export SBAR_ITEM_UPDATE_FREQ_FAST=2
export SBAR_ITEM_UPDATE_FREQ_DEFAULT=10
export SBAR_ITEM_UPDATE_FREQ_SLOW=30

# Weather location
export SBAR_WEATHER_LOCATION="Seoul"

# Widget visibility
export SBAR_CONFIG_VISIBLE="false"
```

### Enable/Disable Widgets

Edit `core/init_widgets.sh` to customize widget arrays:

```bash
export SBAR_WIDGETS_LEFT=(
  "space"
)

export SBAR_WIDGETS_CENTER=(
  "front_app"
)

export SBAR_WIDGETS_RIGHT=(
  "clock"
  "calendar"
  "weather"
  "caffeinate"
  "volume"
  "battery"
  "disk"
  "ram"
  "cpu"
  "netstat"
  "kakaotalk"
  "config"
)
```

### Style Modes

Two style modes are available:

**Block Style** (default):
- Each widget has its own colored background
- Clear visual separation between widgets
- Best for high-contrast display

**Compact Style**:
- Widgets are grouped in containers
- Left, Center, Right sections with shared backgrounds
- More compact appearance

Switch styles via the config menu or by setting:
```bash
export SBAR_BAR_STYLE="compact"  # or "block"
```

### Themes

Multiple themes are available:

**Dark Themes**:
- `onedark` (default) - One Dark color scheme
- `nord` - Nord color scheme
- `tokyonight` - Tokyo Night color scheme
- `githubdark` - GitHub Dark color scheme
- `ayudark` - Ayu Dark color scheme

**Light Themes**:
- `onelight` - One Light color scheme
- `githublight` - GitHub Light color scheme
- `gruvboxlight` - Gruvbox Light color scheme
- `blossomlight` - Blossom Light color scheme
- `ayulight` - Ayu Light color scheme

Switch themes via the config menu or by setting:
```bash
export SBAR_THEME="nord"  # Choose any theme name
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
chmod +x ~/.config/sketchybar/core/*.sh
chmod +x ~/.config/sketchybar/styles/*.sh
chmod +x ~/.config/sketchybar/items/*.sh
chmod +x ~/.config/sketchybar/plugins/*.sh
chmod +x ~/.config/sketchybar/plugins/config/*.sh
chmod +x ~/.config/sketchybar/events/*.sh
chmod +x ~/.config/sketchybar/scripts/*.sh
```

## Credits

- [sketchybar](https://github.com/FelixKratz/SketchyBar) by FelixKratz
- [sketchybar-app-font](https://github.com/kvndrsslr/sketchybar-app-font) by kvndrsslr
- [Nerd Fonts](https://www.nerdfonts.com/)

## License

MIT
