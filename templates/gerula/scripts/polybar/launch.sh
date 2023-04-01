#!/usr/bin/env bash
dir="$HOME/.config/polybar"

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar
	sleep 0.5 # To prevent an issue with the launch

	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Launch the bar
	MONITOR=$DISPLAY2 polybar -c "$dir/$style/config.ini" &
	# Sleep so that we can control where the dock goes
	sleep 0.2
	MONITOR=$DISPLAY1 polybar -c "$dir/$style/config.ini" &
}

if [[ "$1" == "--catppuccin" ]]; then
	style="catppuccin"
	launch_bar
elif [[ "$1" == "--catppuccin-transparent" ]]; then
	style="catppuccin-transparent"
	launch_bar
else
	cat <<- EOF
	Usage : launch.sh --theme

	Available Themes:
  --catppuccin
  --catppuccin-transparent
	EOF
fi
