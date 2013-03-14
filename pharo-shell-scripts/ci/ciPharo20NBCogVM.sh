#!/bin/bash

# stop the script if a single command fails
set -e 

# define an echo that only outputs to stderr
echoerr() { echo "$@" 1>&2; }

echoerr '===================================================='
echoerr 'DEPRECATED as of 2013-03-08 use the PharoVM scripts'
echoerr '===================================================='

# ARHUMENT HANDLING ===========================================================

if { [ "$1" = "-h" ] || [ "$1" = "--help" ]; }; then
    echo "This script will download the latest Pharo 2.0 image and NativeBoost VM

Result in the current directory:
    vm               VM directory
    vm.sh            Script forwarding to the VM in vm
    vm-ui.sh         Script running the VM interactively with a UI
    Pharo.image      The latest pharo image
    Pharo.changes    The corresponding pharo changes"
    exit 0
elif [ $# -gt 0 ]; then
    echo "--help is the only argument allowed"
    exit 1
fi

# FETCH DATA ==================================================================
wget --quiet -O - http://files.pharo.org/script/ciNBCogVM.sh | bash
wget --quiet -O - http://files.pharo.org/script/ciPharo20.sh | bash
