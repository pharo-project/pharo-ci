#!/usr/bin/env bash

set -ex

wget --quiet -O - get.pharo.org/$PHARO+$VM | bash

./pharo Pharo.image save PharoLauncher --delete-old
./pharo PharoLauncher.image --version > version.txt

REPO=http://smalltalkhub.com/mc/Pharo/PharoLauncher/main
./pharo PharoLauncher.image config $REPO ConfigurationOfPharoLauncher --install=$VERSION
./pharo PharoLauncher.image test --junit-xml-output "PharoLauncher.*"
./pharo PharoLauncher.image eval --save "PhLDirectoryBasedImageRepository location"

zip -9r PharoLauncher-developer.zip PharoLauncher.image PharoLauncher.changes

./pharo PharoLauncher.image eval --save "PhLDeploymentScript doAll"

# Create the platform-specific archives
mkdir One
cp PharoLauncher.image   One/Pharo.image
cp PharoLauncher.changes One/Pharo.changes
cp pharo-vm/PharoV*.sources One
git clone git://gitorious.org/pharo-build/pharo-build.git
DATE=$(date +%Y.%m.%d)
bash ./pharo-build/build-platform.sh -i One/Pharo -o Pharo -v $VERSION-$DATE -t Pharo -p mac
bash ./pharo-build/build-platform.sh -i One/Pharo -o Pharo -v $VERSION-$DATE -t Pharo -p win

zip -9r PharoLauncher-urer.zip Pharo.image Pharo.changes
