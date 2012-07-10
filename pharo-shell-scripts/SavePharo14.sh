# input: a path where to copy image and changes files

if [ -z "$WORKSPACE" ] ; then
	WORKSPACE=`pwd`
fi


IMAGES_PATH="/builds/builder/images/"

# Move latest image to start image for next iteration of update
cp "$WORKSPACE"/Pharo-1.4/Pharo-1.4.image "$1"/Pharo-1.4.image
cp "$WORKSPACE"/Pharo-1.4/Pharo-1.4.changes "$1"/Pharo-1.4.changes
