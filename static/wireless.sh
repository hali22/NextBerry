#!/bin/bash
whiptail --msgbox "Select your Wifi network -> right arrow -> make sure you check always connect -> press 'S'ave\n\n Back in the main screen select your network and press 'C'onnect\n\n If it says connected to 'your-wifi' unplug the ethernet cable" 20 90

wicd-curses

whiptail --yesno "Did you manage to connect to a wireless network?\n\n If yes, please remove your ethernet cable, then we'll reboot. " "$WT_HEIGHT" "$WT_WIDTH"
  if [ $? -eq 0 ]; then # yes
    reboot
  fi
exit
