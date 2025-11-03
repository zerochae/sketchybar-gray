#!/usr/bin/env bash

GSBAR_BIN="$HOME/.local/bin/gsbar"
CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"
USER_CONFIG="$CONFIG_DIR/user.sketchybarrc"
DEFAULT_CONFIG="$CONFIG_DIR/sketchybarrc"

get_config_value() {
  local var_name=$1

  if [ -x "$GSBAR_BIN" ]; then
    "$GSBAR_BIN" get "$var_name" 2>/dev/null || echo ""
  else
    local value=""
    if [ -f "$USER_CONFIG" ]; then
      value=$(grep "^export $var_name=" "$USER_CONFIG" | sed 's/.*="\(.*\)"/\1/' | sed 's/.*=\(.*\)/\1/')
    fi
    if [ -z "$value" ] && [ -f "$DEFAULT_CONFIG" ]; then
      value=$(grep "^export $var_name=" "$DEFAULT_CONFIG" | sed 's/.*="\(.*\)"/\1/' | sed 's/.*=\(.*\)/\1/')
    fi
    echo "$value"
  fi
}

set_config_value() {
  local var_name=$1
  local new_value=$2

  if [ -x "$GSBAR_BIN" ]; then
    "$GSBAR_BIN" set "$var_name" "$new_value"
  else
    if [ ! -f "$USER_CONFIG" ]; then
      mkdir -p "$(dirname "$USER_CONFIG")"
      cat >"$USER_CONFIG" <<'EOF'
#!/usr/bin/env bash

# User Custom Configuration
# You can edit this file manually or use gsbar

EOF
    fi

    if grep -q "^export $var_name=" "$USER_CONFIG"; then
      sed -i '' "s|^export $var_name=.*|export $var_name=\"$new_value\"|" "$USER_CONFIG"
    else
      echo "export $var_name=\"$new_value\"" >>"$USER_CONFIG"
    fi
  fi
}
