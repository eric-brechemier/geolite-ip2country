#!/bin/sh
# Update GeoLite country database
#
# Note:
# The database is updated once a month, on first Tuesday of each month [1];
# there thus no need to download it more often than once a month.
#
# Reference:
# [1] GeoLite Free Downloadable Databases
# http://dev.maxmind.com/geoip/legacy/geolite/

# Config
baseDownloadUrl='http://geolite.maxmind.com/download/geoip/database'
geoliteFileName='GeoIP.dat'
geoliteArchiveName="$geoliteFileName.gz"
geoliteDownloadUrl="$baseDownloadUrl/GeoLiteCountry/$geoliteArchiveName"

echo 'Switch to root folder of the project'
cd "$(dirname $0)"
cd ..
echo "$(pwd)"

echo 'Download GeoLite country database'
wget \
  --timestamping \
  --server-response \
  --directory-prefix=data \
  "$geoliteDownloadUrl"

if [ "data/$geoliteFileName.gz" -ot "data/$geoliteFileName" ]
then
  echo 'No new data downloaded.'
else
  echo 'Extract updated data, preserving downloaded archive'
  gunzip --to-stdout "data/$geoliteFileName.gz" > "data/$geoliteFileName"
fi
ls -l data
