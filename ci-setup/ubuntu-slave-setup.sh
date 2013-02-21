#!/bin/bash

# stop the script if a single command fails
set -e 

LIBRARIES="gcc g++ cmake lib32c-dev libasound2-dev libssl-dev libfreetype6-dev libgl1-mesa-dev zip bash-completion htop ruby1.9.1 git-all ia32-libs xz-utils"

# ARGUMENT HANDLING ===========================================================
if { [ "$1" = "-h" ] || [ "$1" = "--help" ]; }; then
    echo "This script will install the necessary libraries for a pharo ubuntu build slave"
    for lib in LIBRARIES; do
        echo $lib;
    done
    exit 0
elif [ $# -gt 0 ];then
    echo "--help is the only argument allowed"
    exit 1
fi

# INSTALL THE LIBRARIES =======================================================

sudo apt-get install $LIBRARIES
