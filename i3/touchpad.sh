#!/bin/bash
# Terminate already running bar instances
#killall -q touchpad.sh

# Wait until the processes have been shut down
#while pgrep -u $UID -x  touchpad.sh >/dev/null; do sleep 1; done

# run 
while true;do
    if xinput list | grep "Logitech USB Receiver" >/dev/null 
    then 
	xinput --disable "SynPS/2 Synaptics TouchPad"
    else 
	xinput --enable "SynPS/2 Synaptics TouchPad"
    fi
    sleep 1
done
