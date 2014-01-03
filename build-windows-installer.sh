#!/bin/sh

cd windows-installer
mkdir Pharo-win
mv ../Pharo Pharo-win/
NSIS/Bin/makensis.exe pharo-installer-builder.nsi
mv pharo_installer.exe ..
