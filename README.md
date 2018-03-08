# PSKZero for Raspberry Pi Zero PSK31
A minilalist PSK31 transmitter software. 

This is a group of scripts that are designed to generate a beacon sentence for PSK31lx (extended version) which will run on a Raspberry Pi Zero in console mode. 

Requirements are Jessie or Stretch (I have not tried Wheezy, in theory it should work). 
dependencies : ncurses, dialog and of cource the extended psk31lx version psk31lx-1.3 located here: 
https://github.com/W5DMH/psk31lx-1.3

you can use the apt-get repository for Stretch install psk31lx version 1.2 then replace the binary and ini files with the files in the compliled-binary folder in the repostory above. 
sudo apt-get install psk31lx  (only known to work for Stretch) 

sudo apt-get install libncurses5-dev libncursesw5-dev 

sudo apt-get install dialog 

sudo git clone http://github.com/w5dmh/PSKZero.git 


issues and questions can be directed to Dan w5dmh@yahoo.com 

