#!/bin/sh

# The wifi_change event supplies a $INFO variable in which the current SSID
# is passed to the script.

if [ "$SENDER" = "wifi_change" ]; then
  WIFI=${INFO:-"Not Connected"}
  sketchybar --set $NAME label="${WIFI}"
fi

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"

if [ "$SSID" = "" ]; then
  sketchybar --set $NAME label="Disconnected" icon=󰖪
else
  sketchybar --set $NAME label="$SSID" icon= 
fi
