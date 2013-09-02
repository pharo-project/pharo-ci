#!/bin/bash

# ARGUMENT HANDLING =============================================================
if { [ "$1" = "-h" ] || [ "$1" = "--help" ]; }; then
	echo 'This script converts newline endings in from \r (carriage return) to \n (line feed).
Note that this script will overwrite files.
	
Usage:
	mac2unix.sh path/to/file/withMacLineEndings.txt'
	exit 1
fi

cat "$1" | tr '\r' '\n' > "$1"