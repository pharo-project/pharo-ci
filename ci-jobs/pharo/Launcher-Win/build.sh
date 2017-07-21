#!/usr/bin/env bash

set -ex

find . -wholename '*VERSION=stable*/Pharo-win.zip' -exec unzip '{}' -d . \;
find . -wholename '*VERSION=stable*/launcher-version.txt' -exec mv '{}' . \;

VERSION=$(cat launcher-version.txt) ./pharo-build-scripts/build-windows-installer.sh

generated_exe=$(echo *.exe)
cp "$generated_exe" latest.exe

# We can't generate the md5sum because the md5 command is not present
# on Windows by default:
#
#   generated_exe=$(echo *.exe)
#   md5 "$generated_exe" > "$generated_exe.md5sum"
