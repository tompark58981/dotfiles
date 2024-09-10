#!/bin/bash

# Load global styles, colors and icons
source "$CONFIG_DIR/globalstyles.sh"

# SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12")

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
    icon=$sid \ 
    padding_left=$(($PADDINGS / 2)) \
    padding_right=$PADDINGS \
    background.height=2 \
    icon.drawing=on \
    icon.color=$LABEL_COLOR \
    icon.padding_left=0 \
    icon.padding_right=0 \
    icon.highlight_color=$HIGHLIGHT \
    label.padding_left=0 \
    label.padding_right=$PADDINGS \
    label.color=$WHITE_50 \
    label.highlight_color=$HIGHLIGHT \
    label.font="sketchybar-app-font:Regular:14.0" \
    label.y_offset=-1 \
    script="$PLUGIN_DIR/space.sh" \ # && $PLUGIN_DIR/space_windows.sh"
    # click_script="aerospace workspace $sid" \

    # apps=$(aerospace list-windows --workspace $sid | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
  #
  # icon_strip=" "
  # if [ "${apps}" != "" ]; then
  #   while read -r app
  #   do
  #     icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
  #   done <<< "${apps}"
  # else
  #   icon_strip=" —"
  # fi
  #
  # sketchybar --set space.$sid label="$icon_strip"

  # for i in $(aerospace list-workspaces --monitor $m --empty); do
  #   sketchybar --set space.$i display=0
  # done

done

# sid=0
# spaces=()
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

# sketchybar --add item space_creator left               \
#            --set space_creator "${space_creator[@]}"   \
#            --subscribe space_creator space_windows_change
