#!/bin/sh
# Convert an IPv4 address to a country name in English
#
# Usage: ip2country-name.sh ipAddress
# where ipAddress is an IPv4 address (###.###.###.###)
ipAddress="$1"
# Config
geoliteDataPath='data/GeoIP.dat'

if [ -z "$ipAddress" ]
then
  echo 'Usage: ip2country-name.sh ipAddress'
  exit 1
fi

cd "$(dirname $0)"

# Format: 'GeoIP Country Edition:'
  # Cut to: ' US, United States'
  # Cut to: ' United States'
  # Cut to: 'United States'
geoiplookup -f "$geoliteDataPath" "$ipAddress" \
  | cut --delimiter=':' --fields=2 \
  | cut --delimiter=',' --fields=2 \
  | cut --characters=2-
