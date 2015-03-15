#!/bin/bash

sudo mount -o remount,rw /

sudo service minidlna force-reload

sudo mount -o remount,rw /