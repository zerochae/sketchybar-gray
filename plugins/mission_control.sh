#!/usr/bin/env bash

get_spaces() {
  local count
  count=$(defaults read com.apple.spaces 2>/dev/null | \
    plutil -convert json -o - - 2>/dev/null | \
    jq -r '.SpacesDisplayConfiguration."Management Data".Monitors[] | select(."Display Identifier" == "Main") | .Spaces | length' 2>/dev/null)

  if [ -z "$count" ] || [ "$count" -eq 0 ]; then
    count=3
  fi

  seq 1 "$count"
}

get_space_apps() {
  osascript -l JavaScript <<'EOF'
const app = Application('System Events');
const processes = app.processes.whose({visible: true});
const apps = [];
for (let i = 0; i < processes.length; i++) {
  try {
    const name = processes[i].name();
    if (name && name !== 'Finder' && name !== 'Dock') {
      apps.push(name);
    }
  } catch (e) {}
}
[...new Set(apps)].join('\n');
EOF
}

get_space_click_command() {
  local sid=$1
  echo "osascript -e 'tell application \"System Events\" to tell expose preferences to set spaces rows to 1' && open -a 'Mission Control' && sleep 0.1 && osascript -e 'tell application \"System Events\" to keystroke \"$sid\"'"
}
