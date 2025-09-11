#!/usr/bin/bash

echo "Install Scanner Support MFCJ497DW..."
sudo pacman -S brscan4
sudo brsaneconfig4 -a name="Brother" model="MFC-J497DW" ip=10.0.0.137
echo "Done!"
sleep 3
clear

echo "Install Printer Support MFCJ497DW..."
sudo pacman -S ghostscript cups lib32-glibc
sudo pacman -S brother-mfc-j497dw
sudo systemctl start cups
sudo systemctl enable cups

echo "Done!"
sleep 3
clear
echo "Done!"
echo "Firefox: http://localhost:631/ (user + password)"
echo "Add Printer"
echo "Choose: Internet Printing Protocol (ipp)"
echo "ipp://10.0.0.137:631/ipp/port1"
echo "Name: MFC-J497DW-WIFI"
echo "Choose brother -> continue"
echo "Choose: IPP Everywhere"
echo "Add printer"

