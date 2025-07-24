#!/bin/bash
#set -e

#!/bin/bash

# List of packages to install
packages=(
 7zip
 alacritty
 alacritty-theme
 arandr
 arc-gtk-theme
 archlinux-logout-git
 archlinux-tweak-tool-git
 aspell
 aspell-en
 aspell-he
 avahi
 awesome-terminal-fonts
 bash-completion
 bat
 baobab
 bibata-cursor-theme
 brave-bin
 btop
 catfish
 curl
 dialog
 dmenu
 dosfstools
 downgrade
 duf
 easytag
 edu-neo-candy-arc-git
 edu-sddm-simplicity-git
 espeak-ng
 evince
 expac
 fastfetch
 fdupes
 feh
 ffmpeg
 fish
 firefox
 firefox-i18n-he
 firefox-ublock-origin
 font-manager
 fzf
 gimp
 git
 gparted
 gpgfrontend
 grsync
 gvfs
 gvfs-dnssd
 gvfs-nfs
 gvfs-smb
 gzip
 htop
 hwinfo
 ilsh-bin-git
 ilsh-shell-git
 ilsh-util-git
 intel-ucode
 inxi
 keepassxc
 kvantum-qt5
 libreoffice-fresh
 lshw
 mcrypt-bin
 meld
 mintstick
 mnemosyne
 mplayer
 nano
 ncdu
 nfs-utils
 nmap
 nordvpn-bin
 noto-fonts
 ntp
 numlockx
 openvpn
 p7zip
 pa-applet-git
 pacmanlogviewer
 paru
 pdftricks
 perl-image-exiftool
 picom
 plocate
 polkit-gnome
 preload
 ptyxis
 pwgen
 rclone
 redshift
 rhythmbox
 ripgrep
 rofi
 rsync
 scrot
 simple-scan
 stow
 sublime-text-4
 surfn-icons-git
 sxhkd
 synology-drive
 the_silver_searcher
 thunar
 thunar-archive-plugin
 thunar-volman
 time
 timeshift
 ttf-ms-win11-auto
 trash-cli
 tree
 unrar
 unzip
 variety
 veracrypt
 vifm
 vim
 virtualbox
 vlc
 webapp-manager
 wget
 xarchiver
 xcolor
 xdotool
 xfce4-clipman-plugin
 xorg-xkill
 xsel
 xvkbd
 yay
 zenity
 zip
 zsh
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
sudo systemctl enable bluetooth.service
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


