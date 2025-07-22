#!/usr/bin/env python3
# sudo pacman -S python-pip libappindicator-gtk3 xorg-xprop xorg-xsetroot
# yay -S xkblayout-state
import subprocess
import time
from threading import Thread
from pystray import Icon, Menu, MenuItem
from PIL import Image

ICON_PATHS = {
    "us": "/home/ilan/.local/share/keyboard-tray/us.png",
    "il": "/home/ilan/.local/share/keyboard-tray/il.png"
}

DEFAULT_ICON = "/home/ilan/.local/share/keyboard-tray/us.png"

def get_layout():
    out = subprocess.check_output(['xkblayout-state', 'print', '%s']).decode().strip()
    return out

class KeyboardLayoutTray:
    def __init__(self):
        self.current_layout = get_layout()
        self.icon = Icon("keyboard_layout")
        self.icon.icon = self.load_icon(self.current_layout)
        self.icon.menu = Menu(MenuItem('Quit', self.quit))
        self.running = True
        Thread(target=self.update_loop, daemon=True).start()

    def load_icon(self, layout):
        path = ICON_PATHS.get(layout, DEFAULT_ICON)
        return Image.open(path).resize((32, 32), Image.Resampling.LANCZOS)

    def update_loop(self):
        while self.running:
            layout = get_layout()
            if layout != self.current_layout:
                self.current_layout = layout
                self.icon.icon = self.load_icon(layout)
            time.sleep(1)

    def quit(self, icon, item):
        self.running = False
        icon.stop()

    def run(self):
        self.icon.run()

if __name__ == "__main__":
    tray = KeyboardLayoutTray()
    tray.run()
