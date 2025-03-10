# Kill all existing polybars
pkill -x polybar

# Check if xrandr is available and handle monitors accordingly
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

