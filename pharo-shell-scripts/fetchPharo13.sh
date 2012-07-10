if [ -z "$WORKSPACE" ] ; then
	WORKSPACE=.
fi

mkdir -p "$WORKSPACE/images"

sh "$WORKSPACE/download.sh" "$WORKSPACE/images/Pharo13.zip" https://ci.lille.inria.fr/pharo/job/Pharo%20Core%201.3/lastSuccessfulBuild/artifact/PharoCore-1.3.zip

unzip -j -o -d "$WORKSPACE/images/" "$WORKSPACE/images/Pharo13.zip"
mv "$WORKSPACE"/images/PharoCore-1.3*.image "$WORKSPACE/images/gforge13.image"
mv "$WORKSPACE"/images/PharoCore-1.3*.changes "$WORKSPACE/images/gforge13.changes"

# fetch PharoV10.sources

mkdir -p "$WORKSPACE/sources"
sh "$WORKSPACE/download.sh" "$WORKSPACE/sources/sources.zip" https://gforge.inria.fr/frs/download.php/24391/PharoV10.sources.zip

unzip -j -o -d "$WORKSPACE/sources/" "$WORKSPACE/sources/sources.zip"
