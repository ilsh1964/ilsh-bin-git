#!/bin/bash
pushd .
cd ~/DATA/SynologyDrive/BACKUP/GITHUB/erikdubois
cd arcolinux-nemesis
git pull
cd ../edu-chadwm
git pull
cd ../edu-dot-files
git pull
cd ../edu-shells
git pull
cd ..

# Mench repo
cd ../mench
git pull
cd ..


# drew Grif
cd drewgrif/dwm-setup
git pull
cd ..
cd butterscripts
git pull
popd
