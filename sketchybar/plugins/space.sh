#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

if [ $SELECTED = true ]; then
  sketchybar --set $NAME background.drawing=on \
                         label.color=$Grey \
                         label.drawing=on \
                         icon.drawing=on \
                         background.color=0x00000000 \
                         background.border_color=$Lime_Blue \
                         background.border_width=5 \
                         icon.color=$Lime_BLue
else
  sketchybar --set $NAME background.drawing=off \
                         label.color=$Lime_Blue \
                         icon.color=$Lime_Blue
fi
