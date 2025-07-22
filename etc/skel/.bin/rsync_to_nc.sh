#!/bin/bash
clear
echo "Do you want to see ONLY the changes: Synology-KERNELIOS -> Nextcloud-Kernelios (Y/n) ?"
read USER_CHOICE
if [ $USER_CHOICE = "Y" ]; then
   rsync -av --cvs-exclude --dry-run  /home/ilan/DATA/SynologyDrive/KERNELIOS/  /home/ilan/DATA/Nextcloud/Kernelios/
   echo; echo; echo
   echo "Do INCRIMENTAL SYNC (Y/n) ? "
   read USER_CHOICE
   if [ $USER_CHOICE = "Y" ]; then
      rsync -av --cvs-exclude --progress  /home/ilan/DATA/SynologyDrive/KERNELIOS/  /home/ilan/DATA/Nextcloud/Kernelios/
   fi
   echo; echo; echo
   echo "Do MIRROR SYNC (Y/n) ? "
   read USER_CHOICE
   if [ $USER_CHOICE = "Y" ]; then
     rsync -av --cvs-exclude --progress --delete /home/ilan/DATA/SynologyDrive/KERNELIOS/  /home/ilan/DATA/Nextcloud/Kernelios/
   fi
   sleep 1
fi


clear
echo "Do you want to see ONLY the changes: Synology-SOFTWARE -> Nextcloud-Software (Y/n) ?"
read USER_CHOICE
if [ $USER_CHOICE = "Y" ]; then
   rsync -av --dry-run  /home/ilan/DATA/SynologyDrive/SOFTWARE/  /home/ilan/DATA/Nextcloud/Software/
   echo; echo; echo
   echo "Do INCRIMENTAL SYNC (Y/n) ? "
   read USER_CHOICE
   if [ $USER_CHOICE = "Y" ]; then
      rsync -av --progress  /home/ilan/DATA/SynologyDrive/SOFTWARE/  /home/ilan/DATA/Nextcloud/Software/
   fi
   echo; echo; echo
   echo "Do MIRROR SYNC (Y/n) ? "
   read USER_CHOICE
   if [ $USER_CHOICE = "Y" ]; then
     rsync -av --progress --delete /home/ilan/DATA/SynologyDrive/SOFTWARE/  /home/ilan/DATA/Nextcloud/Software/
   fi
   sleep 1
fi


clear
echo "Do you want to see ONLY the changes: Synology-STUDIES -> Nextcloud-Studies (Y/n) ? "
read USER_CHOICE
if [ $USER_CHOICE = "Y" ]; then
   rsync -av --dry-run  /home/ilan/DATA/SynologyDrive/STUDIES/  /home/ilan/DATA/Nextcloud/Studies/
   echo; echo; echo
   echo "Do INCRIMENTAL SYNC (Y/n) ? "
   read USER_CHOICE
   if [ $USER_CHOICE = "Y" ]; then
      rsync -av --progress  /home/ilan/DATA/SynologyDrive/STUDIES/  /home/ilan/DATA/Nextcloud/Studies/
   fi
   echo; echo; echo
   echo "Do MIRROR SYNC (Y/n) ? "
   read USER_CHOICE
   if [ $USER_CHOICE = "Y" ]; then
     rsync -av --progress --delete /home/ilan/DATA/SynologyDrive/STUDIES/  /home/ilan/DATA/Nextcloud/Studies/
   fi
   sleep 1
fi
