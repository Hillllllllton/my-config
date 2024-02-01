#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

if [ $SELECTED = true ]; then
  sketchybar --set $NAME background.drawing=on \
                         label.color=$Lime_Blue \
                         label.drawing=on \
                         icon.drawing=on \
                         background.border_color=0xffA3BE8C \
                         background.border_width=5 \
                         background.color=0x00000000 \
                         icon.color=$Lime_BLue
else
  sketchybar --set $NAME background.drawing=off \
                         label.color=$Lime_Blue \
                         icon.color=$Lime_Blue
fi
