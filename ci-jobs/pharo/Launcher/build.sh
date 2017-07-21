#!/usr/bin/env bash

set -ex

function copy_current_stable_image() {
	IMAGES_PATH="images"
	mkdir "$IMAGES_PATH"
	wget -P $IMAGES_PATH http://files.pharo.org/image/stable/latest.zip
    mv "$IMAGES_PATH/latest.zip" "$IMAGES_PATH/pharo-stable.zip"
}

function ensure_pharo_sources_version() {
	HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://file-pharo.inria.fr/sources/PharoV$1.sources.zip)
	if [ $HTTP_CODE -eq 404 ]
	then
  		PHARO_SOURCES=60
	fi
}

wget --quiet -O - get.pharo.org/$PHARO | bash
wget --quiet -O - get.pharo.org/$VM | bash

./pharo Pharo.image save PharoLauncher --delete-old
./pharo PharoLauncher.image --version > version.txt

REPO=http://smalltalkhub.com/mc/Pharo/PharoLauncher/main
./pharo PharoLauncher.image config $REPO ConfigurationOfPharoLauncher --install=$VERSION
./pharo PharoLauncher.image test --junit-xml-output "PharoLauncher.*"
./pharo PharoLauncher.image eval --save "PhLDirectoryBasedImageRepository location"
./pharo PharoLauncher.image eval '(MBConfigurationRoot current configurationInfoFor: ConfigurationOfPharoLauncher) version versionNumber' > launcher-version.txt
VERSION_NUMBER=$(cat launcher-version.txt)

zip -9r PharoLauncher-developer.zip PharoLauncher.image PharoLauncher.changes

./pharo PharoLauncher.image eval --save "PhLDeploymentScript doAll"
# Faster the startup of the launcher image
./pharo PharoLauncher.image eval --save ""

# Create the platform-specific archives
mkdir One
cp PharoLauncher.image   One/Pharo.image
cp PharoLauncher.changes One/Pharo.changes
cd One
wget --quiet http://file-pharo.inria.fr/sources/PharoV50.sources.zip && unzip PharoV50.sources.zip PharoV50.sources && rm PharoV50.sources.zip
copy_current_stable_image
cd ..

DATE=$(date +%Y.%m.%d)
ensure_pharo_sources_version
bash ./pharo-build-scripts/build-platform.sh -i Pharo -o Pharo -r $PHARO -s $PHARO_SOURCES -v $VERSION-$DATE -t Pharo -p mac
bash ./pharo-build-scripts/build-platform.sh -i Pharo -o Pharo -r $PHARO -s $PHARO_SOURCES -v $VERSION-$DATE -t Pharo -p win
bash ./pharo-build-scripts/build-platform.sh -i Pharo -o Pharo -r $PHARO -s $PHARO_SOURCES -v $VERSION-$DATE -t Pharo -p linux
mv Pharo-linux.zip Pharo-linux-$VERSION_NUMBER.zip

zip -9r PharoLauncher-user-$VERSION-$DATE.zip PharoLauncher.image PharoLauncher.changes

md5sum PharoLauncher-user-$VERSION-$DATE.zip > PharoLauncher-user-$VERSION-$DATE.zip.md5sum
