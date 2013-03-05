#!/bin/bash

set -e 

# ARHUMENT HANDLING ===========================================================

if { [ "$1" = "-h" ] || [ "$1" = "--help" ]; }; then
    echo "This script will run some tests on the zeroconf command line scripts"
    exit 0
elif [ $# -gt 0 ]; then
    echo "--help is the only argument allowed"
    exit 1
fi


# MOVE TO THIS SCRIPT LOCATION ================================================

DIR=`readlink "$0"` || DIR="$0";
DIR=`dirname "$DIR"`;
cd "$DIR"
DIR=`pwd`

# RUN TESTS ===================================================================

CURRENT_FILES=*

echo "TESTING --help ====================================================="
echo "===================================================================="
for script in ci*.sh; do
	echo "    $script"
	./$script --help > /dev/null
	# make sure $script didn't generate any additional files
	if [ "$CURRENT_FILES" != "*" ]; then
		echo "$script created additional files on --help!"
		exit 1
	fi
done


echo "TESTING downloads =================================================="
echo "===================================================================="
for script in ci*.sh; do
	echo ""
	echo "    $script ===================================================="
	./$script
	rm -rf vm
	rm -f vm.sh
	rm -f vm-ui.sh
	rm -f Pharo.image
	rm -f Pharo.changes
	# make sure $script didn't generate any additional files
	if [ "$CURRENT_FILES" != "*" ]; then
		echo "$script created additional files on --help!"
		exit 1
	fi
done