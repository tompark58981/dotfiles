#!/bin/bash

# echo $INFO

update() {
  source "$CONFIG_DIR/globalstyles.sh"

  sid=${NAME#space.}

  if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
    COLOR=$HIGHLIGHT
    OFFSET=-12
    SET_HIGHLIGHT=true
  else
    OFFSET=-20
    COLOR=$TRANSPARENT
    HIGHLIGHT=true
  fi

  if [ "$SENDER" = "aerospace_workspace_change" ]; then
    sketchybar --animate tanh 15 \
      --set $NAME icon.highlight=$SET_HIGHLIGHT \
      label.highlight=$SET_HIGHLIGHT \
      background.color=$HIGHLIGHT \
      background.y_offset=$OFFSET
  elif [ "$SENDER" = "aerospace_workspace_switch" ]; then
    WIN_CNT=$(aerospace list-windows --workspace $sid --count)

    if [ $WIN_CNT -gt 0 ]; then
      sketchybar --set $NAME drawing=on
    else
      sketchybar --set $NAME drawing=off
    fi

    source "$CONFIG_DIR/plugins/icon_map.sh"

    apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

    icon_strip=" "
    if [ -n "$apps" ]; then
      while IFS= read -r app; do
        __icon_map "$app"
        icon_strip+=" $icon_result"
      done <<<"$apps"
    else
      icon_strip=" —"
    fi

    sketchybar --set space.$sid label="$icon_strip"
  fi

}

set_space_label() {
  sketchybar --set space.$(aerospace list-workspaces --focused) icon="$@"
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ] || [ "$MODIFIER" = "shift" ]; then
    SPACE_LABEL="$(osascript -e "return (text returned of (display dialog \"Give a name to space $NAME:\" default answer \"\" with icon note buttons {\"Cancel\", \"Continue\"} default button \"Continue\"))")"
    if [ $? -eq 0 ]; then
      if [ "$SPACE_LABEL" = "" ]; then
        set_space_label "${NAME:6}"
      else
        set_space_label "${NAME:6} $SPACE_LABEL"
      fi
    fi
  else
    aerospace workspace ${NAME#*.}
  fi
}

case "$SENDER" in
"mouse.clicked")
  mouse_clicked
  ;;
*)
  update
  ;;
esac
