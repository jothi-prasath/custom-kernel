#!/bin/bash

sudo make -j12  modules_install &&
sudo make install &&
sudo make -j12 headers_install &&
sudo cp /boot/vmlinuz /boot/vmlinuz-custom &&
sudo cp custom.preset /etc/mkinitcpio.d/custom.preset &&
sudo mkinitcpio -p /etc/mkinitcpio.d/custom.preset &&
sudo update-grub

