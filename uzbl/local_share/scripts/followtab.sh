#!/bin/sh

echo 'script @scripts_dir/follownew.js "@{follow_hint_keys} "'$8 | socat - unix-connect:$5
#echo  'uri '$8 | socat - unix-connect:$5
#echo $1 > ~/test
#echo $2 >> ~/test
#echo $3 >> ~/test
#echo $4 >> ~/test
#echo $5 >> ~/test
#echo $6 >> ~/test
#echo $7 >> ~/test
#echo $8 >> ~/test
#echo $testvar >> ~/test
# Read variable set by script. If it equals XXXEMIT_FORM_ACTIVEXXX emit
# FORM_ACTIVE event. If it equals XXXEMIT_ROOT_ACTIVEXXX emit ROOT_ACTIVE
# event.
#rv=$(echo 'js rv' | socat - unix-connect:$socket)
#
#echo $rv \
#  | grep -q XXXEMIT_FORM_ACTIVEXXX \
#  && echo 'event FORM_ACTIVE' \
#  | socat - unix-connect:$socket
#
#echo $rv \
#  | grep -q XXXRESET_MODEXXX \
#  && echo 'set mode =' \
#  | socat - unix-connect:$socket