#!/bin/bash

# download resource from web url
# arguments:
# 1 - output
# 2 - url

CERTCHECK="--no-check-certificate"

# on macs wget is pretty old and not recognizing this option 

wget --help | grep -- "$CERTCHECK" 2>&1 > /dev/null || CERTCHECK=''

wget -nv $CERTCHECK -O "$1" "$2"
