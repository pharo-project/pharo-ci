#!/usr/bin/env bash

set -ex

cd ./*VERSION=[0-9]*
launcher_directory=$(pwd)
launcher_version=$(basename "$(pwd)" \
    | sed -e 's/^.*VERSION=\([0-9.]*\),.*$/\1/')
cd ..

unzip "$launcher_directory/Pharo-mac.zip" 
cp pharo-ci/background/background.png .

VERSION=$launcher_version ./pharo-ci/build-dmg.sh

generated_dmg=$(echo *.dmg)
md5 "$generated_dmg" > "$generated_dmg.md5sum"

# For permalinks on file server
cp "$generated_dmg" latest.dmg
cp "$generated_dmg.md5sum" latest.dmg.md5sum
