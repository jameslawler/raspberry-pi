#!/bin/sh

#mount file system as writeable
sudo mount -o remount,rw /

#Pull latest puppet script and provision
sudo git pull
sudo puppet apply --modulepath ./modules manifests/config.pp --verbose --no-report

#mount file system as read only
sudo mount -o remount,ro /