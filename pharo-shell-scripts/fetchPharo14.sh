if [ -z "$WORKSPACE" ] ; then
	WORKSPACE=.
fi

mkdir -p "$WORKSPACE/images"

sh "$WORKSPACE/download.sh" "$WORKSPACE/images/Pharo14.zip" https://ci.lille.inria.fr/pharo/view/Pharo%201.4/job/Pharo%201.4/lastSuccessfulBuild/artifact/Pharo-1.4.zip 

unzip -j -o -d "$WORKSPACE/images/" "$WORKSPACE/images/Pharo14.zip"
mv "$WORKSPACE"/images/Pharo-1.4*.image "$WORKSPACE/images/gforge14.image"
mv "$WORKSPACE"/images/Pharo-1.4*.changes "$WORKSPACE/images/gforge14.changes"

# fetch PharoV10.sources

mkdir -p "$WORKSPACE/sources"
sh "$WORKSPACE/download.sh" "$WORKSPACE/sources/sources.zip" https://gforge.inria.fr/frs/download.php/24391/PharoV10.sources.zip

unzip -j -o -d "$WORKSPACE/sources/" "$WORKSPACE/sources/sources.zip"
