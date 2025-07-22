#!/bin/bash

mount /dev/nvme0n1p2 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot/efi

mount --types proc /proc /mnt/proc
mount --rbind /sys /mnt/sys
mount --rbind /dev /mnt/dev
mount --rbind /run /mnt/run
mount --bind /sys/firmware/efi/efivars /mnt/sys/firmware/efi/efivars

arch-chroot /mnt
