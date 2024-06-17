#!/usr/bin/env sh

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

if [ "$SOURCE" = "com.apple.keylayout.ABC" ]; then
    LABEL='ABC'
else
    LABEL='速'
fi

sketchybar --set $NAME label="$LABEL"

