#!/bin/bash
volume=$1;

if [ -e "/Volumes/EFI/EFI/CLOVER/config.plist" ]; then
	slicenumber="$(mount| awk -v pattern="$volume" '$0 ~ pattern'| awk -v slice=s2 '$0 ~slice {print slice}')"
	if [ $slicenumber ]; then
		disk="$(mount| awk -v pattern="$volume" '$0 ~ pattern {sub(/s2 /, "s1 "); print$1}')"
		diskutil unmount $disk
	fi

	exit 0;
else
	exit 0;
fi

