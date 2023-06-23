#!/bin/bash

#export CC=clang LLVM=1

sudo make -j$(nproc) modules_install &&
sudo make -j$(nproc) install &&
sudo make -j$(nproc) headers_install &&
sudo cp /boot/vmlinuz /boot/vmlinuz-custom &&
sudo cp custom.preset /etc/mkinitcpio.d/custom.preset &&
sudo mkinitcpio -p /etc/mkinitcpio.d/custom.preset &&
sudo update-grub

