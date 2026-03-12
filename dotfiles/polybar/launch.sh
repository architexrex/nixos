#!/usr/bin/env sh

# Terminate already running bar
pkill polybar

# Wait until the processes have been shut down
while pgrep -u $UID -X polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar main -c $(dirname $0)/config.ini &
