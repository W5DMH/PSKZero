
dialog   --title "Beacon has Stopped!" \
         --textbox "beaconreceived.txt" 8 46 
sudo rm /home/pi/psk31lx/RX/pskreceived.txt
bash /home/pi/PSKZero/PBeacon.sh
