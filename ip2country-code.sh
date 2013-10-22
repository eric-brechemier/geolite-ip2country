#!/bin/sh
# Convert an IPv4 address to a 2-letter country code
#
# Usage: ip2country-code.sh ipAddress
# where ipAddress is an IPv4 address (###.###.###.###)
ipAddress="$1"
# Config
geoliteDataPath='data/GeoIP.dat'

if [ -z "$ipAddress" ]
then
  echo 'Usage: ip2country-code.sh ipAddress'
  exit 1
fi

cd "$(dirname $0)"

# Format: 'GeoIP Country Edition:'
  # Cut to: ' US, United States'
  # Cut to: ' US'
  # Cut to: 'US'
geoiplookup -f "$geoliteDataPath" "$ipAddress" \
  | cut --delimiter=':' --fields=2 \
  | cut --delimiter=',' --fields=1 \
  | cut --characters=2-
