#!/bin/sh

VERSION=${VERSION:-"3.0.0"}

cd pharo-ci/windows-installer
mkdir Pharo-win
mv ../../Pharo Pharo-win/
NSIS/Bin/makensis.exe pharo-installer-builder.nsi
mv pharo_installer.exe ../../pharo_installer-"$VERSION".exe
