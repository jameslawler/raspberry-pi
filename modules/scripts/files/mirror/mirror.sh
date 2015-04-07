#!/bin/bash

# Copy files
sudo mv /media/HDD/Mirror/Movies/* /media/HDD/Media/Movies
sudo mv /media/HDD/Mirror/TV/* /media/HDD/Media/TV

# Restart miniDLNA service
sudo mount -o remount,rw /
sudo service minidlna force-reload
sudo mount -o remount,rw /