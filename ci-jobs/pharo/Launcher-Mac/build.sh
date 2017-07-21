#!/usr/bin/env bash

set -ex

find . -wholename '*VERSION=stable*/Pharo-mac.zip' -exec unzip '{}' . \;
find . -wholename '*VERSION=stable*/launcher-version.txt' -exec mv '{}' . \;
cp pharo-build-scripts/background/background.png .

VERSION=$(cat launcher-version.txt) ./pharo-build-scripts/build-dmg.sh

generated_dmg=$(echo *.dmg)
md5 "$generated_dmg" > "$generated_dmg.md5sum"

# For permalinks on file server
cp "$generated_dmg" latest.dmg
cp "$generated_dmg.md5sum" latest.dmg.md5sum
