#!/bin/bash
#set -e
##################################################################################################################
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
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

tput setaf 3
echo "We will apply these settings"
echo
echo "THEME='Arc-Dawn-Dark'"
echo "ICONS='neo-candy-icons'"
echo "FONT='Noto Sans 11'"
echo "CURSOR='Bibata-Modern-Ice'"
echo "SCHEMA='gsettings set org.gnome.desktop.interface'"
tput sgr0
echo
read -p "Do you want to continue? (Y/y) " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Continuing..."



THEME='Arc-Dawn-Dark'
ICONS='neo-candy-icons'
FONT='Noto Sans 11'
CURSOR='Bibata-Modern-Ice'

SCHEMA='gsettings set org.gnome.desktop.interface'

##################################################################################################################

# /home/erik/.config/dconf/user
apply_dconf() {
	if [ -f $HOME/.config/dconf/user ]; then

		echo
		tput setaf 3
		echo "################################################################"
		echo "################### Applying dconf settings"
		echo "################################################################"
		tput sgr0
		echo

		${SCHEMA} gtk-theme "$THEME"
		${SCHEMA} icon-theme "$ICONS"
		${SCHEMA} cursor-theme "$CURSOR"
		${SCHEMA} font-name "$FONT"
	fi
}

# /home/erik/.config/gtk-3.0/settings.ini
apply_gtk3() {
	if [ -f $HOME/.config/gtk-3.0/settings.ini ]; then

		echo
		tput setaf 3
		echo "################################################################"
		echo "################### Applying gtk-3.0 settings"
		echo "################################################################"
		tput sgr0
		echo

		sed -i "s/gtk-theme-name=.*/gtk-theme-name=$THEME/g" \
		$HOME/.config/gtk-3.0/settings.ini
		sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=$ICONS/g" \
		$HOME/.config/gtk-3.0/settings.ini
		sed -i "s/gtk-cursor-theme-name.*/gtk-cursor-theme-name=$CURSOR/g" \
		$HOME/.config/gtk-3.0/settings.ini
		sed -i "s/gtk-font-name=.*/gtk-font-name=$FONT/g" \
		$HOME/.config/gtk-3.0/settings.ini
	fi
}

# /home/erik/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
apply_xfce() {
	if [ -f $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml ]; then

		echo
		tput setaf 3
		echo "################################################################"
		echo "################### Applying xfce4 settings"
		echo "################################################################"
		tput sgr0
		echo

		sed -i "s/<property name=\"CursorThemeName\" type=\"string\" value=\".*/<property name=\"CursorThemeName\" type=\"string\" value=\"$CURSOR\"\/>/g" \
		$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
		sed -i "s/<property name=\"IconThemeName\" type=\"string\" value=\".*/<property name=\"IconThemeName\" type=\"string\" value=\"$ICONS\"\/>/g" \
		$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
		sed -i "s/<property name=\"ThemeName\" type=\"string\" value=\".*/<property name=\"ThemeName\" type=\"string\" value=\"$THEME\"\/>/g" \
		$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
		sed -i "s/<property name=\"FontName\" type=\"string\" value=\".*/<property name=\"FontName\" type=\"string\" value=\"$FONT\"\/>/g" \
		$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
	fi
}

# /home/erik/.gtkrc-2.0
apply_gtkrc() {
	if [ -f $HOME/.gtkrc-2.0 ]; then

		echo
		tput setaf 3
		echo "################################################################"
		echo "################### Applying gtkrc-2.0 settings"
		echo "################################################################"
		tput sgr0
		echo

		sed -i "s/gtk-theme-name=\".*/gtk-theme-name=\"$THEME\"/g" \
		$HOME/.gtkrc-2.0
		sed -i "s/gtk-icon-theme-name=\".*/gtk-icon-theme-name=\"$ICONS\"/g" \
		$HOME/.gtkrc-2.0
		sed -i "s/gtk-cursor-theme-name=\".*/gtk-cursor-theme-name=\"$CURSOR\"/g" \
		$HOME/.gtkrc-2.0
		sed -i "s/gtk-font-name=\".*/gtk-font-name=\"$FONT\"/g" \
		$HOME/.gtkrc-2.0
	fi
}

# /usr/share/icons/default/index.theme
apply_index() {
	if [ -f /usr/share/icons/default/index.theme ]; then

		echo
		tput setaf 3
		echo "################################################################"
		echo "################### Applying index.theme settings"
		echo "################################################################"
		tput sgr0
		echo

		sudo sed -i "s/Inherits=.*/Inherits=$CURSOR/g" /usr/share/icons/default/index.theme
	fi
}

apply_environment() {
    if [ -f /etc/environment ]; then
        echo
        tput setaf 3
        echo "################################################################"
        echo "################### Applying GTK_THEME in /etc/environment"
        echo "################################################################"
        tput sgr0
        echo

        # Replace existing GTK_THEME line (commented or not), or append it
        if grep -qE '^\s*#?\s*GTK_THEME=' /etc/environment; then
            sudo sed -i "s|^\s*#\?\s*GTK_THEME=.*|GTK_THEME=\"$THEME\"|g" /etc/environment
        else
            echo "GTK_THEME=\"$THEME\"" | sudo tee -a /etc/environment > /dev/null
        fi
    fi
}

apply_dconf
apply_gtk3
apply_xfce
apply_gtkrc
apply_index
apply_environment
sudo cp environment /etc/

echo
tput setaf 3
echo "################################################################"
echo "The settings have been changed to"
echo "Theme    : "$THEME
echo "Cursor   : "$ICONS
echo "Font     : "$FONT
echo "Cursor   : "$CURSOR
echo "################################################################"
tput sgr0

else
    echo "No changes. sExiting..."
fi
