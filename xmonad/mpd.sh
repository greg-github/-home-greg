#!/bin/sh
# mpd script for showing mpd song + artist in xmobar
# add this to xmobarrc
# , Run Com "sh" ["/path/to/mpd.sh"] "mpd" 10
# special thanks to fumbles for the tip
 
MPD="$(mpc | grep "-")"
 
  echo $MPD
