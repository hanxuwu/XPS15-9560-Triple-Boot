#!/bin/bash
volume=$1;

if [ -e "/Volumes/""$volume""/EFI/CLOVER/config.plist" ]; then
    echo "/Volumes/""$volume""/EFI/CLOVER/config.plist found"
	exit 0;
fi

if [ -e "/Volumes/ESP/EFI/CLOVER/config.plist" ]; then
    echo "/Volumes/ESP/EFI/CLOVER/config.plist found"
	exit 0;
fi

if [ -e "/Volumes/EFI/EFI/CLOVER/config.plist" ]; then
    echo "/Volumes/EFI/EFI/CLOVER/config.plist found"
	exit 0;
fi

slicenumber=`(mount| awk -v pattern="$volume" '$0 ~ pattern'| awk -v slice=s2 '$0 ~slice {print slice}')`
if [ $slicenumber ]; then
	disk=`(mount| awk -v pattern="$volume" '$0 ~ pattern {sub(/s2 /, "s1 "); print$1}')`
	diskutil mount $disk
else
    disk=`(mount | grep " / " | awk '{gsub(/s2/,"s1"); print$1}')`
    diskutil mount $disk
fi

if [ -e "/Volumes/EFI/EFI/CLOVER/config.plist" ]; then
    echo "/Volumes/EFI/EFI/CLOVER/config.plist Found"
	exit 0;
else
    echo "/Volumes/EFI/EFI/CLOVER/config.plist Not Found"
	exit 1;
fi