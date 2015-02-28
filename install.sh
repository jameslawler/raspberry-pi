#!/bin/sh

sudo raspi-config
sudo dpkg-reconfigure tzdata
sudo apt-get update
sudo apt-get install puppet-common git
sudo git clone https://github.com/jameslawler/raspberry-pi-puppet.git /home/pi/