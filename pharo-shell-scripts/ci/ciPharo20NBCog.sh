#!/bin/bash

# stop the script if a single command fails
set -e 


# OUTDATE! use newer script ===============================================
wget --quiet -qO - http://files.pharo.org/script/ciPharo20NBCogVM.sh | bash
