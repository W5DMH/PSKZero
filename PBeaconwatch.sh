#!/bin/bash
counter=0
beacon=0
beacon2=0
countdownnum=21
countdowntime=$(date +%M%S)
fileexist='true'
beacon=0

function  transmit {
if [ $beacon -eq 1 ]
then 
sudo cp pskbeacon.txt /home/pi/psk31lx/TX/pskbeacon.txt
#echo "file copied"
#echo $beacon
sleep 1
beacon=0
#else 
#echo "cycle without beacon 0"
fi
}

dialog   --title "Beacon Status" \
               --infobox "\n The beacon is preparing to start, please standby" $


while [ ! -f /home/pi/psk31lx/RX/pskreceived.txt ];
do
countdownnum=21
counter=$(($counter+1))
countdownnum=$(($countdownnum-$counter))
countdowncalc=$(($countdownnum*30))      
countdowntime=$(($countdowncalc/60)) 


if [ $counter -gt 20 ]
then
beacon=$(($beacon+1))
beacon2=$(($beacon2+1))
counter=0
transmit
else
     sleep 30
     dialog         --title "Beacon Status" \
                    --infobox " Beacon will TX every 10 minutes, \n \n Beacon h$
fi
     if [ -f /home/pi/psk31lx/RX/pskreceived.txt ]
     then
     dialog   --title "Beacon has Stopped!" \
              --ok-label "Close Message" \
              --textbox "/home/pi/psk31lx/RX/pskreceived.txt" 8 46
     fileexist='true'
     else
     fileexist='false'
     fi

done

read -s -n1  key

  case $key in
     $'\e')  break ;; 
             
  esac

bash /home/pi/PSKZero/PBeaconstopped.sh

