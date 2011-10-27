if [ -z "$WORKSPACE" ] ; then
	WORKSPACE=.
fi

mkdir -p "$WORKSPACE/images"

sh "$WORKSPACE/download.sh" "$WORKSPACE/images/Pharo13.zip" https://gforge.inria.fr/frs/download.php/29166/PharoCore-1.3-13315.zip

unzip -j -o -d "$WORKSPACE/images/" "$WORKSPACE/images/Pharo13.zip"
mv "$WORKSPACE"/images/Pharo-1.3*.image "$WORKSPACE/images/gforge13.image"
mv "$WORKSPACE"/images/Pharo-1.3*.changes "$WORKSPACE/images/gforge13.changes"

# fetch PharoV10.sources

mkdir -p "$WORKSPACE/sources"
sh "$WORKSPACE/download.sh" "$WORKSPACE/sources/sources.zip" https://gforge.inria.fr/frs/download.php/24391/PharoV10.sources.zip

unzip -j -o -d "$WORKSPACE/sources/" "$WORKSPACE/sources/sources.zip"
