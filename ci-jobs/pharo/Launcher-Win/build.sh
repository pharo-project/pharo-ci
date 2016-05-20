#!/usr/bin/env bash

set -ex

cd ./*VERSION=[0-9]*
launcher_directory=$(pwd)
launcher_version=$(basename "$(pwd)" \
    | sed -e 's/^.*VERSION=\([0-9.]*\),.*$/\1/')
cd ..

unzip "$launcher_directory/Pharo-win.zip"

pwd
VERSION=$launcher_version ./pharo-build-scripts/build-windows-installer.sh

generated_exe=$(echo *.exe)
cp "$generated_exe" latest.exe

# We can't generate the md5sum because the md5 command is not present
# on Windows by default:
#
#   generated_exe=$(echo *.exe)
#   md5 "$generated_exe" > "$generated_exe.md5sum"
