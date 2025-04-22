#!/bin/sh

# Load global styles, colors and icons
source "$CONFIG_DIR/globalstyles.sh"

update() {
  dnd_enabled=$(defaults read com.apple.controlcenter "NSStatusItem Visible FocusModes")
  # alternate method: defaults read com.apple.controlcenter "NSStatusItem Visible FocusModes"
  ICON=􀆺

  if [[ "$SENDER" = "forced" || "$SENDER" = "routine" ]]; then
    if [ $dnd_enabled = 1 ]; then
      COLOR=$LAVENDER
    else
      COLOR=$WHITE_25
    fi
  elif [ "$SENDER" = "focus_off" ]; then
    COLOR=$WHITE_25
  else
    COLOR=$LAVENDER
  fi

  sketchybar --set $NAME icon=$ICON icon.color=$COLOR
}

toggle() {
  osascript -e 'tell application "System Events" to keystroke "\\" using {control down, shift down, command down, option down}'
}

case "$SENDER" in
"routine" | "forced" | "focus_on" | "focus_off")
  update
  ;;
"mouse.clicked")
  toggle
  ;;
esac
