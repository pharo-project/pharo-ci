#!/bin/bash
#
# build-platform.sh -- Builds Pharo based platform-dependent images
#
#

# directory configuration
BASE_PATH="$(cd "$(dirname "$0")" && pwd)"
BUILD_PATH="${WORKSPACE:=$BASE_PATH}"

IMAGES_PATH="$BASE_PATH/images"
ICONS_PATH="$BASE_PATH/platform/icons"
VM_PATH="$BUILD_PATH/vm"
SOURCES_NAME="PharoV20.sources"

# help function
function display_help() {
	echo "$(basename $0) -i input -o output [-n name] [-t title] [-v version] [-c icon] [-w timestamp] -p mac|win|linux"
	echo " -i 		input product name, image from images-directory, or successful jenkins build"
	echo " -o 		output product name (e.g. pharo1.0)"
	echo " -n 		the name of the executable (e.g. pharo)"
	echo " -t 		the title of the application (e.g. Pharo)"
	echo " -v 		the version of the application (e.g. 1.0)"
	echo " -c 		the icon of the application (e.g. Pharo)"
	echo " -w 		a timestamp string (e.g. `date +'%B %d, %Y'`)"
	echo " -p 		build a file for platform mac, win or linux (e.g. mac)"
}

# parse options
while getopts ":i:o:n:t:v:c:w:p:?" OPT ; do
	case "$OPT" in

		# input
		i)	if [ -f "$BUILD_PATH/$OPTARG/$OPTARG.image" ] ; then
				INPUT_IMAGE="$BUILD_PATH/$OPTARG/$OPTARG.image"
			elif [ -f "$BUILD_PATH/$OPTARG.image" ] ; then
				INPUT_IMAGE="$BUILD_PATH/$OPTARG.image"
			elif [ -f "$IMAGES_PATH/$OPTARG/$OPTARG.image" ] ; then
				INPUT_IMAGE="$IMAGES_PATH/$OPTARG/$OPTARG.image"
			elif [ -f "$IMAGES_PATH/$OPTARG.image" ] ; then
				INPUT_IMAGE="$IMAGES_PATH/$OPTARG.image"
			elif [ -f "$WORKSPACE/$OPTARG.zip" ] ; then
				unzip -q "$WORKSPACE/$OPTARG.zip"
				rm -rf "$WORKSPACE/$OPTARG.zip"
				INPUT_IMAGE=`find "$WORKSPACE" -name "$OPTARG.image"`
			elif [ -n "$WORKSPACE" ] ; then
				INPUT_IMAGE=`find "$WORKSPACE" -name "$OPTARG.image"`
			fi

			if [ ! -f "$INPUT_IMAGE" ] ; then
				echo "$(basename $0): input image not found ($OPTARG)"
				exit 1
			fi

			INPUT_CHANGES="${INPUT_IMAGE%.*}.changes"
			if [ ! -f "$INPUT_CHANGES" ] ; then
				echo "$(basename $0): input changes not found ($INPUT_CHANGES)"
				exit 1
			fi

			INPUT_PATH=`dirname "$INPUT_IMAGE"`
			if [ ! -d "$INPUT_PATH" ] ; then
				echo "$(basename $0): input directory not found ($INPUT_PATH)"
				exit 1
			fi
			
			INPUT_SOURCES="$INPUT_PATH/$SOURCES_NAME"
			if [ ! -f "$INPUT_SOURCES" ] ; then
				echo "$(basename $0): sources file not found ($INPUT_SOURCES)"
				exit 1
			fi
		;;

		# output
		o) OUTPUT_NAME="$OPTARG" ;;

		# settings
		n) OPTION_NAME="$OPTARG" ;;
		t) OPTION_TITLE="$OPTARG" ;;
		v) OPTION_VERSION="$OPTARG" ;;
		c) OPTION_ICON="$OPTARG" ;;
		w) OPTION_WHEN="$OPTARG" ;;
		
		# platform
		p) 		OPTION_PLATFORM="$OPTARG" ;;

		# show help
		\?)	display_help
			exit 1
		;;

	esac
done

# check the build platform
if [ -z "$OPTION_PLATFORM" ]; then
	echo "$(basename $0): no build platform given"
	exit 1	
fi 

# check required parameters
if [ -z "$INPUT_IMAGE" ] ; then
	echo "$(basename $0): no input product name given"
	exit 1
fi

if [ -z "$OUTPUT_NAME" ] ; then
	echo "$(basename $0): no output product name given"
	exit 1
fi

# check the default paramaters
if [ -z "$OPTION_NAME" ] ; then
	OPTION_NAME="$OUTPUT_NAME"
fi

if [ -z "$OPTION_TITLE" ] ; then
	OPTION_TITLE="$OUTPUT_NAME"
fi

if [ -z "$OPTION_VERSION" ] ; then
	OPTION_VERSION="1.0"
fi

if [ -z "$OPTION_ICON" ] ; then
	OPTION_ICON="Pharo"
fi

if [ -z "$OPTION_WHEN" ] ; then
	OPTION_WHEN=`date +"%B %d, %Y"`
fi

# prepare output
if [ ! -e "$BUILD_PATH" ] ; then
	mkdir "$BUILD_PATH"
fi

case $OPTION_PLATFORM in 
	mac) 
		PRODUCT_NAME="$OPTION_NAME.app"
		RESOURCES_PATH="Contents/Resources"
		PLATFORM_ICONS_PATH="Contents/Resources"
		;;
	win) 
		PRODUCT_NAME="$OPTION_NAME" 
		RESOURCES_PATH="."
		BIN_PATH="."
		PLATFORM_ICONS_PATH=""
		;;
	linux) 
		PRODUCT_NAME="`echo $OPTION_NAME | awk '{print tolower($0)}'`" 
		EXECUTABLE_NAME="pharo"
		RESOURCES_PATH="shared"
		PLATFORM_ICONS_PATH="icons"
		BIN_PATH="bin"
		;;
	*) 
		echo "$(basename $0): invalid platform given"
		exit 1 
		;;	
esac

OUTPUT_PATH="$BUILD_PATH/$PRODUCT_NAME"
OUTPUT_ARCH="$BUILD_PATH/$OUTPUT_NAME-$OPTION_PLATFORM.zip"
TEMPLATE_PATH="$BASE_PATH/platform/templates/$OPTION_PLATFORM"

if [ -f "$OUTPUT_ARCH" ] ; then
	rm -rf "$OUTPUT_ARCH"
fi

if [ -d "$OUTPUT_PATH" ] ; then
	rm -rf "$OUTPUT_PATH"
fi

# copy over the template
cp -R "$TEMPLATE_PATH" "$OUTPUT_PATH"

# expand all the templates
find "$OUTPUT_PATH" -name "*.template" | while read FILE ; do
	sed \
		-e "s/%{NAME}/$OPTION_NAME/g" \
		-e "s/%{TITLE}/$OPTION_TITLE/g" \
		-e "s/%{VERSION}/$OPTION_VERSION/g" \
		-e "s/%{WHEN}/$OPTION_WHEN/g" \
			"$FILE" > "${FILE%.*}"
	#chmod --reference="$FILE" "${FILE%.*}"
	rm -f "$FILE"
done

# expand all the filenames
find "$OUTPUT_PATH" | while read FILE ; do
	TRANSFORMED_FILE=`echo "$FILE" | sed \
		-e "s/%{NAME}/$EXECUTABLE_NAME/g" \
		-e "s/%{TITLE}/$OPTION_TITLE/g" \
		-e "s/%{VERSION}/$OPTION_VERSION/g" \
		-e "s/%{WHEN}/$OPTION_WHEN/g"`
	if [ "$FILE" != "$TRANSFORMED_FILE" ] ; then
		mv "$FILE" "$TRANSFORMED_FILE"
	fi
done

# copy over the build contents
mkdir -p "$OUTPUT_PATH/$RESOURCES_PATH"
ls -1 "$INPUT_PATH" | while read FILE ; do
	if [ "${FILE##*.}" != "image" ] ; then
		if [ "${FILE##*.}" != "changes" ] ; then
			cp -R "$INPUT_PATH/$FILE" "$OUTPUT_PATH/$RESOURCES_PATH"
		fi
	fi
done

# copy over Linux VM files
if [ "$OPTION_PLATFORM" = "linux" ]; then
	LINUX_VM_PATH="Pharo-VM-linux-stable.zip"
	test -f $LINUX_VM_PATH || wget http://files.pharo.org/vm/pharo/linux/$LINUX_VM_PATH
 
	if [ -f "$LINUX_VM_PATH" ] ; then
	    unzip -q "$LINUX_VM_PATH" -d "$OUTPUT_PATH/tmp"
	    mv "$OUTPUT_PATH/tmp/" "$OUTPUT_PATH/$BIN_PATH"
	else
	    echo "Warning: Cannot find Linux VM!"
	fi
fi

# copy over Mac OS VM files
if [ "$OPTION_PLATFORM" = "mac" ]; then
	MAC_VM_PATH="Pharo-VM-mac-stable.zip"
	test -f $MAC_VM_PATH || wget http://files.pharo.org/vm/pharo/mac/$MAC_VM_PATH

	if [ -f "$MAC_VM_PATH" ] ; then
	    unzip -q "$MAC_VM_PATH" -d "$OUTPUT_PATH/tmp"
    
	    #Ensuring bin and plugins
	    mv "$OUTPUT_PATH/tmp/Pharo.app/Contents/MacOS" "$OUTPUT_PATH/Contents"
	    # Need to add this ugly '*' outside double-quotes to be able to copy the content of the folder (and not the folder itself) on linux
	    cp -R "$OUTPUT_PATH/tmp/Pharo.app/Contents/Resources/"* "$OUTPUT_PATH/Contents/Resources"

	    rm -rf "$OUTPUT_PATH/tmp"
	else
	    echo "Warning: Cannot find Mac OS VM!"
	fi
fi

# copy over Windows VM files
if [ "$OPTION_PLATFORM" = "win" ]; then
	WIN_VM_PATH="Pharo-VM-win-stable.zip"
        test -f $WIN_VM_PATH || wget http://files.pharo.org/vm/pharo/win/$WIN_VM_PATH

	if [ -f "$WIN_VM_PATH" ] ; then
	    unzip -q "$WIN_VM_PATH" -d "$OUTPUT_PATH"
	else
	    echo "Warning: Cannot find Windows VM!"
	fi
fi

# copy over specific files
cp "$INPUT_IMAGE" "$OUTPUT_PATH/$RESOURCES_PATH/$OPTION_NAME.image"
cp "$INPUT_CHANGES" "$OUTPUT_PATH/$RESOURCES_PATH/$OPTION_NAME.changes"
cp "$INPUT_SOURCES" "$OUTPUT_PATH/$RESOURCES_PATH"
if [ ! -z "$PLATFORM_ICONS_PATH" ]; then
	if [ ! -d "$OUTPUT_PATH/$PLATFORM_ICONS_PATH" ]; then
		mkdir $OUTPUT_PATH/$PLATFORM_ICONS_PATH
	fi
	cp -R "$ICONS_PATH/"* "$OUTPUT_PATH/$PLATFORM_ICONS_PATH" # Need to add this ugly '*' outside double-quotes to be able to copy the content of the folder (and not the folder itself) on linux
fi
# ensure the linux script is executable
if [ "$OPTION_PLATFORM" = "linux" ]; then
	chmod +x "$OUTPUT_PATH/$EXECUTABLE_NAME"
fi 
# zip up the application
cd "$BUILD_PATH"
zip -q -r -9 "$OUTPUT_ARCH" "$PRODUCT_NAME"
cd - > /dev/null

# remove the build directory
rm -rf "$OUTPUT_PATH"

# success
exit 0
