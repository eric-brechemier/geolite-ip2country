#!/bin/sh
# Uninstall the package geoip-bin used to query geolocation data
#
# Note:
# Downloaded data (located in data/ folder of current project)
# is not deleted by this script.

echo 'Uninstall project dependencies (using sudo)'
sudo apt-get --yes purge geoip-bin
sudo apt-get --yes autoremove
