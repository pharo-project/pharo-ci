#!/bin/bash

if [ -z "$WORKSPACE" ] ; then
	WORKSPACE=.
fi

mkdir -p "$WORKSPACE/images"

sh "$WORKSPACE/download.sh" "$WORKSPACE/images/Pharo20.zip" https://gforge.inria.fr/frs/download.php/31366/Pharo-2.0-262.zip

unzip -j -o -d "$WORKSPACE/images/" "$WORKSPACE/images/Pharo20.zip"
mv "$WORKSPACE"/images/Pharo-2.0*.image "$WORKSPACE/images/gforge20.image"
mv "$WORKSPACE"/images/Pharo-2.0*.changes "$WORKSPACE/images/gforge20.changes"

# fetch PharoV10.sources

mkdir -p "$WORKSPACE/sources"
sh "$WORKSPACE/download.sh" "$WORKSPACE/sources/sources.zip" https://gforge.inria.fr/frs/download.php/24391/PharoV10.sources.zip

unzip -j -o -d "$WORKSPACE/sources/" "$WORKSPACE/sources/sources.zip"
