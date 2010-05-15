emacs --daemon &
sleepd -s s2ram -u 1800 &
parcellite -d &
setxkbmap -option terminate:ctrl_alt_bksp &
nitrogen --restore &
screen &
xcompmgr -o 0 -c &
exec xmonad
