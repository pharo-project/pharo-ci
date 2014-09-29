#!/usr/bin/env bash

set -ex

git clone https://github.com/pharo-project/pharo-ci.git
cd pharo-ci
unzip ../Pharo-mac.zip
mv background/background.png .
./build-dmg.sh
