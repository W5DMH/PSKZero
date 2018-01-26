#!/bin/bash
# A simple shell script to display the form dialog on screen
# set field names i.e. shell variables
call1=""
call2=""
message=""

# open fd
exec 3>&1
# Store data to $VALUES variable
VALUES=$(dialog --extra-button --extra-label "Beacon Off" --ok-label "Beacon On " \
	  --backtitle "PSKBeacon Setup" \
	  --title "PSKBeacon" \
	  --form "Create a new beacon" \
12 44 0 \
	"From Callsign:" 1 1	"$call2" 	1 14 8 0 \
        "To Callsign:"    3 1	"$call1"  	3 14 8 0 \
	 "Message:"    5 1	"$message"  	5 14 25 0 \
2>&1 1>&3) 

ret=$?
echo "$ret"
# close fd
exec 3>&-

case "$ret" in
  0) choice='START' ;; # the 'ok' button
  1) echo 'Cancel chosen'; exit ;;
  3) choice='STOP' ;; # the 'extra' button
  *) echo 'unexpected (ESC?)'; exit ;;


esac

{
  read -r call1
  read -r call2
  read -r message
} <<< "$VALUES"

beacon="$call1 $call1 de $call2 $call2 $message"

if [ "$choice" = 'START' ] 
then
   [ -e pskbeacon.txt ] && rm pskbeacon.txt
   bash ./PBeaconwatch.sh
   # display values just entered
   echo $beacon >>pskbeacon.txt
elif [[ "$choice" = 'STOP' ]]; then
  echo 'Beacon has been cancelled'
  [ -e pskbeacon.txt ] && rm pskbeacon.txt
  bash ./PBeacon.sh
fi




#beacon="$call1 $call1 de $call2 $call2 $message"
#[ -e pskbeacon.txt ] && rm pskbeacon.txt
# display values just entered
#echo $beacon >>pskbeacon.txt

