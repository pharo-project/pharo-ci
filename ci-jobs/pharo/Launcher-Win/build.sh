#!/usr/bin/env bash

set -ex

cd ./*VERSION=[0-9]*
launcher_directory=$(pwd)
launcher_version=$(basename "$(pwd)" \
    | sed -e 's/^.*VERSION=\([0-9.]*\),.*$/\1/')
cd ..

unzip "$launcher_directory/Pharo-win.zip"

VERSION=$launcher_version ./pharo-ci/build-windows-installer.sh

generated_exe=$(echo *.exe)
md5 "$generated_exe" > "$generated_exe.md5sum"
