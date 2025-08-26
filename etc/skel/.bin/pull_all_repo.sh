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
cd ../edu-variety-config
git pull
cd ../nemesis_repo
git pull
cd ../kirodubes
git pull
cd ..

# Mench repo
cd ../mench
git pull
cd ../


# dwm-setup
cd dwm-setup
git pull

popd
