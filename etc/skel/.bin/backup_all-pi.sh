#!/usr/bin/bash
# SYNTAX: sudo tar cf etc_backup.tar --exclude=/etc/apt /etc
NOW=$(date +"20%y-%m-%d")
tar -cpf /NFS/WEB/home-$NOW.tar \
  --exclude /home/ilan/docker/navidrome/music \
  --exclude /home/ilan/docker/jellyfin/movies \
  --exclude /home/ilan/docker/jellyfin/tvshows \
  --exclude /home/ilan/docker/metube/downloads \
  /home/ilan  1>/dev/null 2>&1
tar -cpf /NFS/WEB/etc-$NOW.tar /etc  1>/dev/null 2>&1
del_files 1>/dev/null 2>&1
exit 0
