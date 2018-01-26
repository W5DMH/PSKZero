#!/bin/bash

dialog   --title "Beacon has Stopped!" \
         --textbox "beaconreceived.txt" 8 46 

bash PBeacon.sh
