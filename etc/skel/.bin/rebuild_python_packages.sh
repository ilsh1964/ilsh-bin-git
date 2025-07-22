#!/bin/bash

# List all packages in the old Python site-packages directory
packages=$(sudo pacman -Qoq /usr/lib/python3.12/site-packages)

# Reinstall official packages
for pkg in $packages; do
    if pacman -Si "$pkg" &>/dev/null; then
        sudo pacman -S --noconfirm "$pkg"
    else
        # Rebuild AUR packages
        if command -v yay &>/dev/null; then
            yay -S --noconfirm "$pkg"
        elif command -v paru &>/dev/null; then
            paru -S --noconfirm "$pkg"
        else
            echo "AUR helper not installed. Manually rebuild: $pkg"
        fi
    fi
done
