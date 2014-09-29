#!/usr/bin/env bash

set -ex

unzip PharoLauncher-*-mac.zip
cp pharo-ci/background/background.png .
./pharo-ci/build-dmg.sh
