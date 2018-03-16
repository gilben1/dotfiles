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
#if [ -f ~/.config/polybar/dyn.var ] ; then
#    polybar main &
#    polybar top &
#elif [ -f ~/.config/polybar/static.var ] ; then
#    polybar --config="$HOME/.config/polybar/config_static" main &
#    polybar --config="$HOME/.config/polybar/config_static" top &
#    #polybar dummy &
#fi

if [ -f ~/.config/polybar/dyntop.var ] ; then
    polybar top &
elif [ -f ~/.config/polybar/statictop.var ] ; then
    polybar --config="$HOME/.config/polybar/config_static" top &
fi

if [ -f ~/.config/polybar/dynbot.var ] ; then
    polybar main &
elif [ -f ~/.config/polybar/staticbot.var ] ; then
    polybar --config="$HOME/.config/polybar/config_static" main &
fi


sleep 2

~/.bin/scripts/hideIt.sh --name '^polybar-main_LVDS1$' \
          --direction bottom \
          --peek 3 \
          -r 0x768+1366+-10 &

~/.bin/scripts/hideIt.sh --name '^polybar-top_LVDS1$' \
          --direction top \
          --peek 3 \
          -r 0x0+1366+10 &

#~/.bin/scripts/hideIt.sh --name '^Polybar tray window$' \
#          --direction bottom \
#          --peek 3 \
#          -r 0x768+1366+-10 &


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
