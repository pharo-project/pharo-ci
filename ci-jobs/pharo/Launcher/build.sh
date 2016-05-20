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

# Download the sources files
cd One
wget --quiet http://file-pharo.inria.fr/sources/PharoV10.sources.zip && unzip PharoV10.sources.zip PharoV10.sources && rm PharoV10.sources.zip
wget --quiet http://file-pharo.inria.fr/sources/PharoV20.sources.zip && unzip PharoV20.sources.zip PharoV20.sources && rm PharoV20.sources.zip
wget --quiet http://file-pharo.inria.fr/sources/PharoV30.sources.zip && unzip PharoV30.sources.zip PharoV30.sources && rm PharoV30.sources.zip
wget --quiet http://file-pharo.inria.fr/sources/PharoV40.sources.zip && unzip PharoV40.sources.zip PharoV40.sources && rm PharoV40.sources.zip
wget --quiet http://file-pharo.inria.fr/sources/PharoV50.sources.zip && unzip PharoV50.sources.zip PharoV50.sources && rm PharoV50.sources.zip
cd ..

DATE=$(date +%Y.%m.%d)
bash ./pharo-build-scripts/build-platform.sh -i Pharo -o Pharo -s $PHARO -v $VERSION-$DATE -t Pharo -p mac
bash ./pharo-build-scripts/build-platform.sh -i Pharo -o Pharo -s $PHARO -v $VERSION-$DATE -t Pharo -p win

zip -9r PharoLauncher-user-$VERSION-$DATE.zip PharoLauncher.image PharoLauncher.changes

md5sum PharoLauncher-user-$VERSION-$DATE.zip > PharoLauncher-user-$VERSION-$DATE.zip.md5sum
