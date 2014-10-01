#!/usr/bin/env bash

set -ex

cd ./*VERSION=[0-9]*
launcher_directory=$(pwd)
# launcher_version=$(basename "$(pwd)" \
#     | sed -e 's/^.*VERSION=\([0-9.]*\),.*$/\1/')
cd ..

unzip "$launcher_directory/Pharo-mac.zip" 
cp pharo-ci/background/background.png .
./pharo-ci/build-dmg.sh

generated_dmg=*.dmg
md5sum "$generated_dmg" > "$generated_dmg.md5sum"
