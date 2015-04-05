# Raspberry PI Read-Only Provisioning

Configure a Raspberry Pi with the following features

1. Read only file system (to prevent corrupt SD cards)
1. Mount USB external HDD
1. Share folders via SAMBA
1. Share media using MiniDLNA
1. Mirror media folders

##  Install Wheezy Raspbian

Source instructions - http://www.raspberrypi.org/documentation/installation/installing-images/linux.md

1. Download [Wheezy Raspbian](http://www.raspberrypi.org/downloads)
1. Use `dd` to write the image to the SD card (make sure you're writing to the right disk!)
```
    $ sudo dd bs=4M if=2014-12-24-wheezy-raspbian.img | pv | sudo dd of=/dev/mmcblk0

    $ sudo sync
```

## To install puppet on a fresh raspberry pi:

Beware: The fresh install scripts have not been test yet.

    $ ssh pi@<ip of pi>
    $ curl https://raw.github.com/jameslawler/puppet/master/install.sh | sh
    $ curl https://raw.github.com/jameslawler/puppet/master/make-pi-readonly.sh | sh

## To update raspberry pi:

    $ ssh pi@<ip of pi>
    $ ./raspberry-pi-puppet/update.sh
