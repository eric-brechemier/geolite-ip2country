geolite-ip2country
==================

Shell scripts to convert an IPv4 IP address to a Country
using GeoLite data created by MaxMind.

## LANGUAGE ##

Shell (dash)

## TARGET PLATFORM ##

Ubuntu 12.04 LTS

## DEPENDENCIES ##

* the command `geoiplookup` from the package geoip-bin

## USAGE ##

  * `setup/install.sh` - install dependencies and download GeoLite data
  * `ip2country-code.sh 8.8.8.8` - convert an IPv4 to a country code
  * `ip2country-name.sh 8.8.8.8` - convert an IPv4 to a country name
  * `setup/update-data.sh` - update GeoLite data (once a month)
  * `setup/uninstall.sh` - uninstall dependencies

## AUTHOR ##

Eric Bréchemier <github@eric.brechemier.name>

## LICENSES ##

* MIT for this project
* CC-BY-SA MaxMind for GeoLite data

## ATTRIBUTION FOR GEOLITE DATA BY MAXMIND ##

This product includes GeoLite data created by MaxMind,
available from [http://www.maxmind.com](http://www.maxmind.com).
