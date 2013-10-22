#!/bin/sh
# Install the package geoip-bin used to query geolocation data
# and download GeoLite data in data/ folder in current project,
# if not present already.
#
# Note:
# The GeoLite data should be updated about once a month for typical usage,
# using a separate script: setup/update-data.sh

echo 'Install project dependencies (using sudo)'
sudo apt-get --yes install geoip-bin

echo 'Switch to root folder of the project'
cd "$(dirname $0)"
cd ..
echo "$(pwd)"

if [ -d data ]
then
  echo 'Folder data/ exists already:'
  ls -l data
  echo 'Use setup/update-data.sh if you wish to update downloaded data.'
else
  echo 'Create data folder'
  mkdir data
  echo 'Download initial data'
  ./setup/update-data.sh
fi
