#!/bin/bash

# COPY FLAGS ICONS
mkdir -p  ~/.local/share/keyboard-tray/
cp flags/*.png ~/.local/share/keyboard-tray


# TEST 00-keyboard.conf FILE
FILE="/etc/X11/xorg.conf.d/00-keyboard.conf"
TMPFILE="$(mktemp)"

REQUIRED_SECTION=$(cat <<EOF
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbLayout" "us,il"
    Option "XkbModel" "pc105"
    Option "XkbVariant" ",,grp:alt_shift_toggle"
EndSection
EOF
)

# Function to normalize whitespace and remove comments
normalize() {
    sed '/^\s*#/d' | sed '/^\s*$/d' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}

# Check if the file contains the exact section (normalized)
if [ -f "$FILE" ]; then
    CURRENT_SECTION=$(awk '/Section "InputClass"/,/EndSection/' "$FILE" | normalize)
    REQUIRED_NORM=$(echo "$REQUIRED_SECTION" | normalize)

    if [ "$CURRENT_SECTION" = "$REQUIRED_NORM" ]; then
        echo "✅ Keyboard configuration is already correct."
    else
        echo "⚠ Section exists but differs — updating..."
    fi
else
    echo "⚠ Config file does not exist — creating it."
    sudo mkdir -p "$(dirname "$FILE")"
fi

# Write the correct section to temp file
echo "$REQUIRED_SECTION" > "$TMPFILE"

# Backup the existing config (if any)
if [ -f "$FILE" ]; then
    sudo cp "$FILE" "$FILE.bak"
    echo "✅ Backup saved as $FILE.bak"
fi

# Remove any existing Section "InputClass" block
if [ -f "$FILE" ]; then
    awk '
    BEGIN {inblock=0}
    /Section "InputClass"/ {inblock=1; next}
    /EndSection/ {if(inblock){inblock=0; next}}
    {if(!inblock) print $0}
    ' "$FILE" > "$TMPFILE.tmp"
    mv "$TMPFILE.tmp" "$TMPFILE"
fi

# Append the required section
echo "$REQUIRED_SECTION" >> "$TMPFILE"

# Copy final result with sudo
sudo cp "$TMPFILE" "$FILE"
rm "$TMPFILE"

echo "✓ Keyboard configuration fixed in $FILE"

# List of required packages
PACKAGES=(
  python-pip
  python-pystray
  libappindicator-gtk3
  xorg-xprop
  xorg-xsetroot
  xkblayout-state-git
)

# Function to check if a package is installed
is_installed() {
  pacman -Q "$1" &>/dev/null
}

# Install missing packages
MISSING=()
for pkg in "${PACKAGES[@]}"; do
  if ! is_installed "$pkg"; then
    MISSING+=("$pkg")
  fi
done

if [ "${#MISSING[@]}" -eq 0 ]; then
  echo "✅ All packages are already installed."
else
  echo "📦 Installing missing packages: ${MISSING[*]}"
  sudo pacman -S --needed "${MISSING[@]}"
fi


#### TEST /etc/default/keyboard FILE
KEYBOARD_FILE="/etc/default/keyboard"

REQUIRED_KEYS=(
  'XKBMODEL="pc105"'
  'XKBLAYOUT="us,il"'
  'XKBVARIANT=""'
  'XKBOPTIONS="grp:alt_shift_toggle"'
  'BACKSPACE="guess"'
)

# Function to check if a key=value exists and is correct
check_key() {
  local key="$1"
  grep -q "^${key}$" "$KEYBOARD_FILE"
}

# Backup original file
sudo cp "$KEYBOARD_FILE" "${KEYBOARD_FILE}.bak"

UPDATED=false

for entry in "${REQUIRED_KEYS[@]}"; do
  KEY=$(echo "$entry" | cut -d= -f1)
  if grep -q "^${KEY}=" "$KEYBOARD_FILE"; then
    # Key exists, but is it correct?
    if ! check_key "$entry"; then
      echo "🔧 Updating $KEY to $entry"
      sudo sed -i "s|^${KEY}=.*|${entry}|" "$KEYBOARD_FILE"
      UPDATED=true
    fi
  else
    # Key doesn't exist, append it
    echo "➕ Adding missing entry: $entry"
    echo "$entry" | sudo tee -a "$KEYBOARD_FILE" >/dev/null
    UPDATED=true
  fi
done

if [ "$UPDATED" = true ]; then
  echo "✅ Updated $KEYBOARD_FILE"
else
  echo "✅ All entries already set correctly in $KEYBOARD_FILE"
fi


# TEST ~/.xprofile FILE
LINE='setxkbmap -layout us,il -option grp:alt_shift_toggle'
PROFILE="$HOME/.xprofile"

# Create the file if it doesn't exist
if [ ! -f "$PROFILE" ]; then
    touch "$PROFILE"
    echo "📄 Created $PROFILE"
fi

# Check if the line already exists
if grep -Fxq "$LINE" "$PROFILE"; then
    echo "✅ Line already exists in $PROFILE"
else
    echo "$LINE" >> "$PROFILE"
    echo "➕ Added line to $PROFILE"
fi

sudo mkdir -p  /usr/share/sddm/scripts/
sudo cp -p Xsetup /usr/share/sddm/scripts/Xsetup


