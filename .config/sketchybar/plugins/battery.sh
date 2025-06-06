#!/bin/bash

source "$CONFIG_DIR/colors.sh"

render_item() {

  PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
  CHARGING=$(pmset -g batt | grep 'AC Power')
  CHARGING_STATUS="Not charging"

  if [ $PERCENTAGE = "" ]; then
    exit 0
  fi

  COLOR=$LABEL_COLOR

  case ${PERCENTAGE} in
  9[0-9] | 100)
    ICON="􀛨"
    COLOR=$GREEN
    ;;
  [6-8][0-9])
    ICON="􀺸"
    COLOR=$GREEN
    ;;
  [3-5][0-9])
    ICON="􀺶"
    COLOR=$YELLOW
    ;;
  [1-2][0-9])
    ICON="􀛩"
    COLOR=$RED
    ;;
  *)
    ICON="􀛪"
    COLOR=$RED
    ;;
  esac

  if [[ $CHARGING != "" ]]; then
    ICON="􀢋"
    CHARGING_STATUS="Charging"
    COLOR=$GREEN
  fi

  sketchybar --set battery label="$PERCENTAGE%" label.drawing=on icon=$ICON icon.color=$COLOR

}

render_popup() {
  sketchybar --set battery.details label="$PERCENTAGE% (${CHARGING_STATUS})"
}

update() {
  render_item
  render_popup
}

popup() {
  sketchybar --set "$NAME" popup.drawing="$1"
}

case "$SENDER" in
"routine" | "forced" | "power_source_change")
  update
  ;;
"mouse.entered")
  popup on
  ;;
"mouse.exited" | "mouse.exited.global")
  popup off
  ;;
esac
