#!/bin/sh

cd windows-installer
NSIS/Bin/makensis.exe pharo-installer-builder.nsi
mv pharo_installer.exe ..
