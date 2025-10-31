#!/usr/bin/env bash

USER_CONFIG="$CONFIG_DIR/user.sketchybarrc"
DEFAULT_CONFIG="$CONFIG_DIR/sketchybarrc"
EXAMPLE_CONFIG="$CONFIG_DIR/user.sketchybarrc.example"

ensure_user_config() {
  if [ ! -f "$USER_CONFIG" ]; then
    if [ -f "$EXAMPLE_CONFIG" ]; then
      cp "$EXAMPLE_CONFIG" "$USER_CONFIG"
    else
      touch "$USER_CONFIG"
      echo "#!/usr/bin/env bash" > "$USER_CONFIG"
      echo "" >> "$USER_CONFIG"
      echo "# User Custom Configuration" >> "$USER_CONFIG"
      echo "" >> "$USER_CONFIG"
    fi
  fi
}

get_config_value() {
  local var_name=$1
  local value=""

  if [ -f "$USER_CONFIG" ]; then
    value=$(grep "^export $var_name=" "$USER_CONFIG" | sed 's/.*="\(.*\)"/\1/' | sed 's/.*=\(.*\)/\1/')
  fi

  if [ -z "$value" ]; then
    value=$(grep "^export $var_name=" "$DEFAULT_CONFIG" | sed 's/.*="\(.*\)"/\1/' | sed 's/.*=\(.*\)/\1/')
  fi

  echo "$value"
}

set_config_value() {
  local var_name=$1
  local new_value=$2
  local use_quotes=${3:-true}

  ensure_user_config

  if grep -q "^export $var_name=" "$USER_CONFIG"; then
    if [ "$use_quotes" = "true" ]; then
      sed -i '' "s|^export $var_name=.*|export $var_name=\"$new_value\"|" "$USER_CONFIG"
    else
      sed -i '' "s|^export $var_name=.*|export $var_name=$new_value|" "$USER_CONFIG"
    fi
  else
    if [ "$use_quotes" = "true" ]; then
      echo "export $var_name=\"$new_value\"" >> "$USER_CONFIG"
    else
      echo "export $var_name=$new_value" >> "$USER_CONFIG"
    fi
  fi
}
