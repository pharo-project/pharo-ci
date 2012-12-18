#!/bin/bash

# stop the script if a single command fails
set -e 


# OUTDATE! use newer script ===============================================
wget --quiet -qO - http://pharo.gforge.inria.fr/ci/ciPharo20CogVM.sh | bash
