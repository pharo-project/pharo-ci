#!/usr/bin/env bash

set -ex

launcher_directory="./*VERSION=[0-9]*"
# launcher_version=$(basename "$(pwd)" \
#     | sed -e 's/^.*VERSION=\([0-9.]*\),.*$/\1/')

unzip "$launcher_directory/PharoLauncher-*-mac.zip" 
cp pharo-ci/background/background.png .
./pharo-ci/build-dmg.sh
