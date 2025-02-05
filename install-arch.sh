#!/bin/bash

# Prompt the user for input
read -p "Enter the Btrfs disk (e.g., /dev/sda2): " btrfs_disk
read -p "Enter the name of the new subvolume (e.g., @arch): " subvol_name
read -p "Enter the boot partition (e.g., /dev/sda4): " boot_partition

# Mount the Btrfs disk
mount $btrfs_disk /mnt/

# Create subvolumes
btrfs subvolume create /mnt/$subvol_name
btrfs subvolume create /mnt/$subvol_name/@
btrfs subvolume create /mnt/$subvol_name/@home
btrfs subvolume create /mnt/$subvol_name/@opt

# Unmount the Btrfs disk
umount /mnt

# Mount the subvolume
mount $btrfs_disk /mnt/ -o subvol=$subvol_name/@

# Create directories
mkdir /mnt/home
mkdir /mnt/opt
mkdir /mnt/boot

# Mount the subvolumes
mount $btrfs_disk /mnt/home -o subvol=$subvol_name/@home
mount $btrfs_disk /mnt/opt -o subvol=$subvol_name/@opt

# Mount the boot partition
mount $boot_partition /mnt/boot

echo "Mounting and subvolume creation complete."
