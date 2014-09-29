#!/usr/bin/env bash
ROOT=$(dirname $0)
cd $ROOT
ROOT=$(pwd)

#BUILD_PATH="${WORKSPACE:=$ROOT/builds}"
BUILD_PATH="/builds/jenkins/workspace"
IMAGES_PATH="/builds/builder/images/"

# Move latest image to start image for next iteration of update
cp $BUILD_PATH/Pharo\ Kernel\ 1.4/PharoKernel-1.4/PharoKernel-1.4.image $IMAGES_PATH/PharoKernel-1.4.image
cp $BUILD_PATH/Pharo\ Kernel\ 1.4/PharoKernel-1.4/PharoKernel-1.4.changes $IMAGES_PATH/PharoKernel-1.4.changes
