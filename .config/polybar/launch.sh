#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar
#pids=$(pgrep -f "hideIt")
for id in $(pgrep -f "hideIt") ; do
    kill $id
done



# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar main &
polybar top &
#polybar dummy &

sleep 2

~/.bin/scripts/hideIt.sh --name '^polybar-main_LVDS1$' \
          --direction bottom \
          --peek 3 \
          -r 0x768+1366+-20 &

~/.bin/scripts/hideIt.sh --name '^polybar-top_LVDS1$' \
          --direction top \
          --peek 1 \
          -r 0x0+1366+10 &

#~/.bin/scripts/hideIt.sh --name '^polybar-main_LVDS1$' \
#          --direction bottom \
#          --peek 3 \
#          -S
#
#~/.bin/scripts/hideIt.sh --name '^polybar-top_LVDS1$' \
#          --direction top \
#          --peek 1 \
#          -S
echo "Bars launched..."
