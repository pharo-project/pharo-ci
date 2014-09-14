#!/usr/bin/env bash

set -ex

# jenkins puts all the params after a / in the job name as well :(
export JOB_NAME=`dirname $JOB_NAME`

wget --quiet -O - get.pharo.org/$PHARO+$VM | bash

./pharo Pharo.image save $JOB_NAME --delete-old
./pharo $JOB_NAME.image --version > version.txt

REPO=http://smalltalkhub.com/mc/Pharo/$JOB_NAME/main
./pharo $JOB_NAME.image config $REPO ConfigurationOf$JOB_NAME --install=$VERSION
./pharo $JOB_NAME.image test --junit-xml-output "PharoLauncher.*"
./pharo $JOB_NAME.image eval --save "PhLDirectoryBasedImageRepository location"

zip -r $JOB_NAME.zip $JOB_NAME.image $JOB_NAME.changes
