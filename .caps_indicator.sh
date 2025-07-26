#!/bin/sh

 # This changes terminal cursor between block and underline style by if the caps are on or off.

 while true; do

  caps_state=$(xset q | grep "Caps Lock:" | awk '{print $4}')

  if [ "$caps_state" = "on" ]; then

    echo -ne '\e[1 q' # Block shape

  else

    echo -ne '\e[3 q' # Underline shape

  fi

  sleep 0.5 

 done

