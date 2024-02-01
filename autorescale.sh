# Initially set previous_resolution to nothing
previous_resolution=""
desired_resolution="3840 x 2160"    # Change this to your desired resolution

while true; do
    # Fetch current resolution
    current_resolution=$(system_profiler SPDisplaysDataType | grep Resolution | awk '{print $2, $3, $4}')

    # Check if the resolution has changed
    if [ "$current_resolution" != "$previous_resolution" ]; then
        echo "Resolution change detected: $current_resolution"

        # Run your commands here
       
        if [ "$current_resolution" = "$desired_resolution" ]; then
    # If yes, run the yabai commands
          yabai -m config top_padding 55
          yabai -m config bottom_padding 34
          yabai -m config left_padding 34
          yabai -m config right_padding 34
          yabai -m config window_gap 44
          borders width=23
          osascript ~/.config/toggleMenuBar.applescript
          brew services start sketchybar 

      else
          echo "Resolution is not 3840 x 2160, skipping configuration changes."
          yabai -m config top_padding 10
          yabai -m config bottom_padding 10
          yabai -m config left_padding 10
          yabai -m config right_padding 10
          yabai -m config window_gap 15
          brew services stop sketchybar
          osascript ~/.config/toggleMenuBar.applescript
          borders width=13
      fi

        # Update previous_resolution
        previous_resolution=$current_resolution
    fi

    # Wait for a bit before checking again
    sleep 5
done
