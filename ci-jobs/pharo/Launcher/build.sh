#!/usr/bin/env bash

set -ex

function copy_current_stable_image() {
	IMAGES_PATH="images"
	mkdir "$IMAGES_PATH"
	wget -P $IMAGES_PATH http://files.pharo.org/image/stable/latest.zip
    mv "$IMAGES_PATH/latest.zip" "$IMAGES_PATH/pharo-stable.zip"
}

function copy_prespur_vm() {
	TARGET_OS_TYPE=$1
	VM_PATH=$TARGET_OS_TYPE/vm
	VM_PRESPUR="pharo-$TARGET_OS_TYPE-stable.zip"
	VM_PRESPUR_PATH="$VM_PATH/$VM_PRESPUR"
	test -f $VM_PRESPUR_PATH || wget -P $VM_PATH http://files.pharo.org/get-files/40/$VM_PRESPUR

	if [ -f "$VM_PRESPUR_PATH" ] ; then
		mkdir -p $VM_PATH/40
	    unzip -q "$VM_PRESPUR_PATH" -d "$VM_PATH/40"
	    rm "$VM_PRESPUR_PATH"
		cd $VM_PATH/40
		wget --quiet http://file-pharo.inria.fr/sources/PharoV10.sources.zip && unzip PharoV10.sources.zip PharoV10.sources && rm PharoV10.sources.zip
		wget --quiet http://file-pharo.inria.fr/sources/PharoV20.sources.zip && unzip PharoV20.sources.zip PharoV20.sources && rm PharoV20.sources.zip
		wget --quiet http://file-pharo.inria.fr/sources/PharoV30.sources.zip && unzip PharoV30.sources.zip PharoV30.sources && rm PharoV30.sources.zip
		wget --quiet http://file-pharo.inria.fr/sources/PharoV40.sources.zip && unzip PharoV40.sources.zip PharoV40.sources && rm PharoV40.sources.zip
		cd -
	else
	    echo "Warning: Cannot find pre-spur VM for $TARGET_OS_TYPE!"
	fi
}

wget --quiet -O - get.pharo.org/$PHARO+$VM | bash

./pharo Pharo.image save PharoLauncher --delete-old
./pharo PharoLauncher.image --version > version.txt

REPO=http://smalltalkhub.com/mc/Pharo/PharoLauncher/main
./pharo PharoLauncher.image config $REPO ConfigurationOfPharoLauncher --install=$VERSION
./pharo PharoLauncher.image test --junit-xml-output "PharoLauncher.*"
./pharo PharoLauncher.image eval --save "PhLDirectoryBasedImageRepository location"

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
# prepare platform-specific bundles
for OS_TYPE in "linux" "mac" "win"
do
	copy_prespur_vm $OS_TYPE
done
cd ..

DATE=$(date +%Y.%m.%d)
bash ./pharo-build-scripts/build-platform.sh -i Pharo -o Pharo -r $PHARO -s $PHARO -v $VERSION-$DATE -t Pharo -p mac
bash ./pharo-build-scripts/build-platform.sh -i Pharo -o Pharo -r $PHARO -s $PHARO -v $VERSION-$DATE -t Pharo -p win
bash ./pharo-build-scripts/build-platform.sh -i Pharo -o Pharo -r $PHARO -s $PHARO -v $VERSION-$DATE -t Pharo -p linux

zip -9r PharoLauncher-user-$VERSION-$DATE.zip PharoLauncher.image PharoLauncher.changes

md5sum PharoLauncher-user-$VERSION-$DATE.zip > PharoLauncher-user-$VERSION-$DATE.zip.md5sum
