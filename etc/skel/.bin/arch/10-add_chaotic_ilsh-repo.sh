#!/bin/bash
#set -e
##################################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################################

clear
echo "Updating the system..."
sudo pacman -Syyy --noconfirm
sleep 5
echo 
clear

tput setaf 3
echo
echo "copying pacman.conf and chaotic-mirrorlist..."
sudo cp pacman.conf /etc/
sudo cp chaotic-mirrorlist /etc/pacman.d/
echo
tput setaf 2
echo "DONE!"
sleep 5

clear
echo
tput setaf 3
echo
echo "Adding keys..."
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
echo
tput setaf 2
echo "DONE!"
sleep 5

clear
echo
tput setaf 3
echo
echo "installing chaotic-keyring and chaotic-mirrorlist packages..."
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo
tput setaf 2
echo "DONE!"
sleep 5

clear
echo
tput setaf 3
echo
echo "Updating the system..."
sudo pacman -Syyy --noconfirm
echo "DONE..."
echo
tput setaf 2
echo "DONE!"
sleep 5