#!/usr/bin/env bash

set -ex

cd ./*VERSION=[0-9]*
launcher_directory=$(pwd)
cd ..

unzip "$launcher_directory/PharoLauncher-*-mac.zip" 
cp pharo-ci/background/background.png .
./pharo-ci/build-dmg.sh
