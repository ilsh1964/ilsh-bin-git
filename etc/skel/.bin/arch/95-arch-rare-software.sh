#!/bin/bash
#set -e

#!/bin/bash

# List of packages to install
packages=(
 discord
 drawing
 flameshot
 galculator
 hardinfo2
 hdparm
 losslesscut
 networkmanager
 network-manager-applet
 networkmanager-openvpn
 pa-applet-git
 simplescreenrecorder
 smartmontools
 telegram-desktop
 wireless-regdb
 wireless_tools
)

# Function to check if a package is already installed
is_installed() {
    pacman -Qi "$1" &> /dev/null
}

# Update the system
echo "Updating the system..."
sudo pacman -Syy --noconfirm

# Install the packages
echo "Installing packages..."
for package in "${packages[@]}"; do
    if is_installed "$package"; then
        # echo "$package is already installed."
        sleep 0.1
    else
        echo "Installing $package..."
        sudo pacman -S --noconfirm "$package"
    fi
done

echo "All packages have been processed!"

sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service
sudo usermod -aG vboxusers $USER
##############################################################################################################
##                                              HELP                                                        ##
##############################################################################################################
## expac - get information about installed packages (from the local databas)
##   expac '%n'     -  print installed packages name
##   expac '%n %m'  -  print installed packages name and size
##   expac '%n %v'  -  print installed packages name and version
##
## ripgrep - cli recursively search through the current directory for a regex pattern.
##   fast and efficient, combining the speed of Silver Searcher and grep
##   automatically ignores files like .gitignore, .ignore...
##   works on Linux, macOS, and Windows.
##      rg "example" - search for "example" in all files in the current directory and its subdirectories.
##      rg -i "example" - ignore case
##      rg -t txt  - limit the search to specific file types (e.g., only .txt files)
##      rg -n "example" - show Line Numbers
##
##  hardinfo2 - nice GTK app for viewing the hardware components
##
##  xcolor  # get color code from the terminal
##############################################################################################################


