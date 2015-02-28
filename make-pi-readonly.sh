#!/bin/sh

sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile disable
sudo sudo apt-get install unionfs-fuse

sudo cp union_fs.conf /usr/local/bin/mount_unionfs

sudo chmod +x /usr/local/bin/mount_unionfs
sudo cp -al /etc /etc_org
sudo mv /var /var_org
sudo mkdir /etc_rw
sudo mkdir /var /var_rw