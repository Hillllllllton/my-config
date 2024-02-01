# Initially set previous_resolution to nothing
previous_resolution=""
external_resolution="3024 x 1964"    # Change this to your external monitor resolution

while true; do
    # Fetch current resolution
    current_resolution=$(system_profiler SPDisplaysDataType | grep Resolution | awk '{print $2, $3, $4}')

    # Check if the resolution has changed
    if [ "$current_resolution" != "$previous_resolution" ]; then
        echo "Resolution change detected: $current_resolution"

        # Run your commands here

        if [ "$current_resolution" = "$external_resolution" ]; then
            # If yes, run the yabai commands for the external monitor
            echo "Setting up for external monitor resolution."
            yabai -m config top_padding 10
            yabai -m config bottom_padding 10
            yabai -m config left_padding 10
            yabai -m config right_padding 10
            yabai -m config window_gap 15
            borders width=13
            osascript ~/.config/toggleMenuBar.applescript
            brew services stop sketchybar

        else
            # Run yabai commands for other resolutions
            echo "Setting up for different resolution."
            yabai -m config top_padding 60
            yabai -m config bottom_padding 34
            yabai -m config left_padding 34
            yabai -m config right_padding 34
            yabai -m config window_gap 44
            borders width=23
            osascript ~/.config/toggleMenuBar.applescript
            brew services start sketchybar
        fi

        # Update previous_resolution
        previous_resolution=$current_resolution
    fi

    # Wait for a bit before checking again
    sleep 5
done
