#!/bin/bash

# https://material-theme.com/docs/reference/color-palette/

# foreground=""
# text="0xff676e95"
# selection_background="0xff717cb470"
# selection_foreground="0xffffffff"
# buttons="0xff303348"
# second_background="0xff34324a"
# disabled="0xff515772"
# active="0xff414863"
# highlight="0xff444267"
# tree=""
# notifications="0xff202331"
# accent_color=""
# excluded_files_color="0xff2f2e43"
# green_color=""
# yellow_color=""
# blue_color=""
# purple_color=""
# orange_color=""
# cyan_color="0xff89ddff"
# gray_color=""
# white_color=""
# error_color="0xffff5370"

O100=0xff
O75=0xbf
O50=0x80
O25=0x40
O10=0x1a

# Base Colors
export BASE_BLACK="181926" #181926
export BASE_WHITE="eeeeee" #eeeeee

# Color Palette
export BLACK="$O100""$BASE_BLACK"
export BLACK_75="$O75""$BASE_BLACK"
export BLACK_50="$O50""$BASE_BLACK"
export BLACK_25="$O25""$BASE_BLACK"
export WHITE="$O100""$BASE_WHITE"
export WHITE_75="$O75""$BASE_WHITE"
export WHITE_50="$O50""$BASE_WHITE"
export WHITE_25="$O25""$BASE_WHITE"
export WHITE_10="$O10""$BASE_WHITE"
export RED=0xfff38ba8        #f38ba8
export GREEN=0xffa6e3a1      #a6e3a1
export TEAL=0xff94e2d5       #94e2d5
export CYAN=0xff89DDFF       #89DDFF
export BLUE=0xff82aaff       #82aaff
export OSBLUE=0xff0259D1     #0259D1
export YELLOW=0xffffcb6b     #ffcb6b
export ORANGE=0xfff78c6c     #f78c6c
export PEACH=0xfffab387      #fab387
export MAGENTA=0xffab47bc    #ab47bc
export DARK_GREY=0xff292d3e  #292d3e
export GREY=0xff676e95       #676e95
export GREY_50=0x80676e95    #676e95
export LIGHT_GREY=0xffa6accd #a6accd
export ROSEWATER=0xfff5e0dc  #f5e0dc
export TRANSPARENT=0x00000000

# General bar colors
export BAR_COLOR=$BLACK_50         #292d3e
export CONTRAST=0xff34324a         #34324a
export BAR_BORDER_COLOR=0xff2b2a3e #2b2a3e
export ICON_COLOR=$WHITE
export ICON_COLOR_INACTIVE=$GREY
export LABEL_COLOR=$WHITE_75
export HIGHLIGHT=$PEACH
export POPUP_BACKGROUND_COLOR=$DARK_GREY
export POPUP_BORDER_COLOR=$TRANSPARENT
export SHADOW_COLOR=$BLACK
