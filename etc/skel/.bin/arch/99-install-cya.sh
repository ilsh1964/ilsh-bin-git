#!/usr/bin/bash

clear
echo "Copying scripts to /usr/local/bin "
sudo cp cya /usr/local/bin
sudo chown root:root /usr/local/bin/*
sudo chmod 755 /usr/local/bin/*
sleep 1
clear

echo "Do you want to create, enable and start the cya systemd daemon? (y/n)"
read CHOICE
if test $CHOICE = "y"; then
  sudo cp systemd/cya* /etc/systemd/system
  sudo chown root:root /etc/systemd/system/cya.service /etc/systemd/system/cya.timer
  sudo chmod 644 /etc/systemd/system/cya.service /etc/systemd/system/cya.timer
  sudo systemctl enable cya.timer
  sudo systemctl start cya.timer
  sleep 1
  systemctl status cya.timer
fi
sleep 1
clear

echo "Done"
echo
echo
echo "EXAMPLE:"
echo "~/home/cya/cya.conf:"
echo 'DISCLAIMER="off"'
echo 'MAX_SAVES="2"'
