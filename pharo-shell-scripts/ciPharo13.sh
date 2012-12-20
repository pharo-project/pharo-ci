#!/bin/bash

# stop the script if a single command fails
set -e 

# ARHUMENT HANDLING ===========================================================

if [[ "$1" = "-h" || "$1" = "--help" ]];then
    echo "This script will download the latest Pharo 1.4 image

Result in the current directory:
    Pharo.image      The latest pharo image
    Pharo.changes    The corresponding pharo changes"
    exit 0
elif [[ $# -gt 0 ]];then
    echo "--help is the only argument allowed"
    exit 1
fi

# DOWNLOAD THE LATEST IMAGE ===================================================
IMAGE_URL="http://pharo.gforge.inria.fr/ci/image/13/13328.zip"
wget --progress=bar:force --output-document=image.zip $IMAGE_URL

IMAGE_DIR="image"
mkdir $IMAGE_DIR

unzip -q -d $IMAGE_DIR image.zip

# find the image name
PHARO_IMAGE=`find $IMAGE_DIR -name *.image`
PHARO_CHANGES=`find $IMAGE_DIR -name *.changes`

# rename
mv "$PHARO_IMAGE" Pharo.image
mv "$PHARO_CHANGES" Pharo.changes

# CLEANUP =====================================================================
rm -rf image image.zip

echo Pharo.image
echo Pharo.changes
