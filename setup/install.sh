#!/bin/sh
# Install the package geoip-bin used to query geolocation data
# and download GeoLite data in data/ folder in current project,
# if not present already.
#
# Note:
# The GeoLite data should be updated about once a month for typical usage,
# using a separate script: setup/update-data.sh

# Config
baseDownloadUrl='http://geolite.maxmind.com/download/geoip/database'
geoliteFileName='GeoIP.dat'
geoliteArchiveName="$geoliteFileName.gz"
geoliteDownloadUrl="$baseDownloadUrl/GeoLiteCountry/$geoliteArchiveName"
geoliteArchivePath="data/$geoliteArchiveName"
geoliteDataPath="data/$geoliteFileName"

echo 'Install project dependencies (using sudo)'
sudo apt-get --yes install geoip-bin

echo 'Switch to root folder of the project'
cd "$(dirname $0)"
cd ..
echo "$(pwd)"

if [ -f "$geoliteDataPath" ]
then
  echo 'GeoLite data is present already.'
  echo 'Use setup/update-data.sh instead if you wish to update it.'
else
  echo 'Create data folder'
  mkdir data
  echo 'Download initial data'
  wget "$geoliteDownloadUrl" --output-document="$geoliteArchivePath"
  echo 'Extract data from downloaded archive'
  gunzip --verbose "$geoliteArchivePath"
fi
ls -l "$geoliteDataPath"
