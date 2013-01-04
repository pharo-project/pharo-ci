#!/bin/bash

# stop the script if a single command fails
set -e 

# ARHUMENT HANDLING ===========================================================

if {[ "$1" = "-h" ] || [ "$1" = "--help" ]}; then
    echo "outdated please use the newer ciPharo14CogVM.sh
    "
    exit 0
elif [ $# -gt 0 ]; then
    echo "--help is the only argument allowed"
    exit 1
fi

# FETCH DATA ==================================================================
wget --quiet -qO - http://pharo.gforge.inria.fr/ci/ciPharo14CogVM.sh | bash
