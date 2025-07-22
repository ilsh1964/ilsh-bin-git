#!/usr/bin/bash
sudo pacman -S virtualbox-guest-utils
sleep 2
sudo systemctl enable vboxservice
sudo systemctl start vboxservice

# This command is necessary if you want to have access to shared folders
# The guest OS mounts folders from the host using the vboxsf module
# Access to these folders is restricted to users in the vboxsf group
sudo usermod -aG vboxsf ilan

