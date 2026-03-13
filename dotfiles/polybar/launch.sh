#!/usr/bin/env sh

# Terminate already running bar
pkill polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.1; done

# Launch new polybar
polybar center &

