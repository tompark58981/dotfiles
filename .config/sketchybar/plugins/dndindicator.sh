#!/usr/bin/env bash

# Thanks to reddit:rudypaul
# BIN_DIR="/usr/bin"

# PLUTIL="${BIN_DIR}/plutil"
# XPATH="${BIN_DIR}/xpath"
# BASE64="${BIN_DIR}/base64"

dnd_enabled=$(
  defaults read com.apple.controlcenter "NSStatusItem Visible FocusModes"
  # dnd_enabled=$(
  #     "${PLUTIL}" -extract dnd_prefs xml1 -o - ~/Library/Preferences/com.apple.ncprefs.plist |
  #         "${XPATH}" -q -e 'string(//data)' |
  #         "${BASE64}" -D |
  #         "${PLUTIL}" -convert xml1 - -o - |
  #         "${XPATH}" -q -e 'boolean(//key[text()="userPref"]/following-sibling::dict/key[text()="enabled"])'
)

if [ $dnd_enabled -eq 1 ]; then
  sketchybar --set $NAME drawing=on icon=􀆺
else
  sketchybar --set $NAME drawing=off icon=
fi
