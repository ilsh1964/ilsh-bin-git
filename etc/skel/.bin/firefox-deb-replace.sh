#!/usr/bin/env bash
# firefox-deb-replace.sh
# Replace Snap Firefox with the official deb version on Ubuntu 24.04

set -e

echo "=== Removing Snap Firefox ==="
if snap list firefox &>/dev/null; then
    sudo snap remove --purge firefox
else
    echo "Firefox Snap not found, skipping removal."
fi

echo "=== Removing leftover Snap Firefox config ==="
rm -rf ~/snap/firefox

echo "=== Adding Mozilla Team PPA ==="
sudo add-apt-repository -y ppa:mozillateam/ppa

echo "=== Configuring APT preferences (to avoid Snap reinstall) ==="
cat <<EOF | sudo tee /etc/apt/preferences.d/mozilla-firefox
Package: firefox*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
EOF

echo "=== Updating package lists ==="
sudo apt update

echo "=== Installing Firefox (deb) from Mozilla PPA ==="
# Allow downgrades so APT can replace Canonical's transitional package
sudo apt install -y --allow-downgrades firefox -t "o=LP-PPA-mozillateam"

echo "=== Fixing Firefox binary hijack ==="
# Remove Canonical's snap wrapper if it exists
sudo rm -f /usr/bin/firefox

# Detect the installed Firefox binary
if [ -x /usr/lib/firefox/firefox ]; then
    FIREFOX_BIN="/usr/lib/firefox/firefox"
elif [ -x /opt/firefox/firefox ]; then
    FIREFOX_BIN="/opt/firefox/firefox"
else
    echo "Error: Firefox binary not found after installation!"
    exit 1
fi

# Create proper symlink
sudo ln -sf "$FIREFOX_BIN" /usr/bin/firefox

echo "=== Done! Installed Firefox version: ==="
/usr/bin/firefox --version
