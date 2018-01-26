#!/bin/bash
counter=0
beacon=0
countdownnum=21
countdowntime=$(date +%M%S)
fileexist='true'

dialog   --title "Beacon Status" \
               --infobox "\n The beacon is preparing to start, please standby" 10 46


while [ ! -f beaconreceived.txt ];
do
countdownnum=21
counter=$(($counter+1))
countdownnum=$(($countdownnum-$counter))
countdowncalc=$(($countdownnum*30))      
countdowntime=$(($countdowncalc/60)) 


if [ $counter -gt 20 ]
then
beacon=$(($beacon+1))

counter=0
else


     sleep 30
     dialog         --title "Beacon Status" \
                    --infobox "beacon is transmitting every 1o minutes, \n \n the beacon has been transmitted $beacon times \n \n The next beacon is in $countdowntime min" 10 46
fi
     if [ -f beaconreceived.txt ]
     then
     dialog   --title "Beacon has Stopped!" \
              --ok-label "Close Message" \
              --textbox "beaconreceived.txt" 8 46
     fileexist='true'
     else
     fileexist='false'
     fi
ret=$?
leave=255
    if [ $ret -eq $leave ] 
    then 
    echo "true"
    fi  



done
bash PBeaconstopped.sh
