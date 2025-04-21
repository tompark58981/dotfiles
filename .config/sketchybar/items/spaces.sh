#!/bin/bash

# Load global styles, colors and icons
source "$CONFIG_DIR/globalstyles.sh"
source "$CONFIG_DIR/plugins/icon_map.sh"

sketchybar --add event aerospace_workspace_change
sketchybar --add event aerospace_workspace_switch

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
    --set space.$sid \
    icon="$sid" \
    drawing=off \
    label.font="sketchybar-app-font:Regular:14.0" \
    padding_left=$(($PADDINGS / 2)) \
    padding_right=$PADDINGS \
    background.height=2 \
    icon.color=$LABEL_COLOR \
    icon.padding_left=0 \
    icon.padding_right=0 \
    icon.highlight_color=$HIGHLIGHT \
    label.padding_left=0 \
    label.padding_right=$PADDINGS \
    label.color=$WHITE_50 \
    label.highlight_color=$HIGHLIGHT \
    label.y_offset=-1 \
    label="$sid" \
    click_script="aerospace workspace $sid" \
    script="$CONFIG_DIR/plugins/space.sh $sid" \
    updates=on \
    --subscribe space.$sid aerospace_workspace_change \
    --subscribe space.$sid aerospace_workspace_switch

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

  if [ $(aerospace list-windows --workspace $sid --count) -gt 0 ]; then
    sketchybar --set space.$sid drawing=on
  fi
done
#
# sid=0
# spaces=()
#
# for i in "${!SPACE_ICONS[@]}"; do
#   sid=$(($i + 1))
#
#   space=(
#     space=$sid
#     padding_left=$(($PADDINGS / 2))
#     padding_right=$PADDINGS
#     background.height=2
#     icon.drawing=on
#     icon="${SPACE_ICONS[i]}"
#     icon.color=$LABEL_COLOR
#     icon.padding_left=0
#     icon.padding_right=0
#     icon.highlight_color=$HIGHLIGHT
#     label.padding_left=0
#     label.padding_right=$PADDINGS
#     label.color=$WHITE_50
#     label.highlight_color=$HIGHLIGHT
#     label.font="sketchybar-app-font:Regular:14.0"
#     label.y_offset=-1
#     script="$PLUGIN_DIR/space.sh" # && $PLUGIN_DIR/space_windows.sh"
#   )
#
#   sketchybar --add space space.$sid left \
#     --set space.$sid "${space[@]}" \
#     --subscribe space.$sid mouse.clicked space_windows_change front_app_switched
#   done
#
# space_creator=(
#   icon=􀐇
#   icon.font="$FONT:Regular:14.0"
#   padding_left=$PADDINGS
#   padding_right=$PADDINGS
#   icon.padding_right=$PADDINGS
#   label.drawing=off
#   display=active
#   click_script='yabai -m space --create'
#   script="$PLUGIN_DIR/space_windows.sh"
#   icon.color=$HIGHLIGHT
# )
#
# sketchybar --add item space_creator left \
#   --set space_creator "${space_creator[@]}" \
#   --subscribe space_creator space_windows_change
