#!/bin/bash
#
# build.sh -- Builds Pharo images using a series of Smalltalk
#   scripts. Best to be used together with Jenkins.
#
# Copyright (c) 2010 Yanni Chiu <yanni@rogers.com>
# Copyright (c) 2010 Lukas Renggli <renggli@gmail.com>
#

# vm configuration 

if [ -z "$WORKSPACE" ] ; then
  WORKSPACE=`pwd`
fi

# get the current script loction
DIR=`dirname "$0"`;

if [ -z "$PHARO_VM" ] ; then
    export PHARO_VM=`$DIR/pharo-shell-scripts/fetchLatestVM.sh`
    if [ -z "$PHARO_VM" ] ; then
        echo "PHARO_VM environment variable is not set."
        exit 1
    fi
fi

echo "Using VM:
--------
$PHARO_VM
--------
"

PHARO_PARAM="-nodisplay -nosound"

if [ `uname` == "Darwin" ]; then
  PHARO_PARAM="-headless"
fi

# directory configuration
BUILD_PATH="${WORKSPACE}"

IMAGES_PATH="$WORKSPACE/images"
SCRIPTS_PATH="$WORKSPACE/scripts"
SOURCES_PATH="$WORKSPACE/images"
BUILD_CACHE="$WORKSPACE/cache"
SUPPORT_PATH="$WORKSPACE/support"

# help function
function display_help() {
  echo "$(basename $0) -i input -o output {-s script} "
  echo " -i input product name, image from images-directory, or successful jenkins build"
  echo " -o output product name"
  echo " -s one or more scripts from the scripts-directory to build the image"
  echo " -t name of the temporary image (not archived)"
  echo " -c one or more scripts executed on temporary image"
}

# parse options
while getopts ":i:o:s:t:c:?" OPT ; do
  case "$OPT" in

    # input
    i)  if [ -f "$BUILD_PATH/$OPTARG/$OPTARG.image" ] ; then
        INPUT_IMAGE="$BUILD_PATH/$OPTARG/$OPTARG.image"
      elif [ -f "$BUILD_PATH/$OPTARG.image" ] ; then
        INPUT_IMAGE="$BUILD_PATH/$OPTARG.image"
      elif [ -f "$IMAGES_PATH/$OPTARG/$OPTARG.image" ] ; then
        INPUT_IMAGE="$IMAGES_PATH/$OPTARG/$OPTARG.image"
      elif [ -f "$IMAGES_PATH/$OPTARG.image" ] ; then
        INPUT_IMAGE="$IMAGES_PATH/$OPTARG.image"
      elif [ -n "$WORKSPACE" ] ; then
        INPUT_IMAGE=`find -L "$WORKSPACE/../.." -name "$OPTARG.image" | grep "/lastSuccessful/" | head -n 1`
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
    ;;

    # temporary input
    t)  if [ -f "$BUILD_PATH/$OPTARG/$OPTARG.image" ] ; then
        TEMPORARY_IMAGE="$BUILD_PATH/$OPTARG/$OPTARG.image"
      elif [ -f "$BUILD_PATH/$OPTARG.image" ] ; then
        TEMPORARY_IMAGE="$BUILD_PATH/$OPTARG.image"
      elif [ -f "$IMAGES_PATH/$OPTARG/$OPTARG.image" ] ; then
        TEMPORARY_IMAGE="$IMAGES_PATH/$OPTARG/$OPTARG.image"
      elif [ -f "$IMAGES_PATH/$OPTARG.image" ] ; then
        TEMPORARY_IMAGE="$IMAGES_PATH/$OPTARG.image"
      elif [ -n "$WORKSPACE" ] ; then
        TEMPORARY_IMAGE=`find -L "$WORKSPACE/../.." -name "$OPTARG.image" | grep "/lastSuccessful/" | head -n 1`
      fi

      if [ ! -f "$TEMPORARY_IMAGE" ] ; then
        echo "$(basename $0): temporary image not found ($OPTARG)"
        exit 1
      fi

      TEMPORARY_CHANGES="${TEMPORARY_IMAGE%.*}.changes"
      if [ ! -f "$TEMPORARY_CHANGES" ] ; then
        echo "$(basename $0): temporary changes not found ($TEMPORARY_CHANGES)"
        exit 1
      fi
    ;;


    # output
    o)  OUTPUT_NAME="$OPTARG"
      OUTPUT_PATH="$BUILD_PATH/$OUTPUT_NAME"
      OUTPUT_SCRIPT="$OUTPUT_PATH/$OUTPUT_NAME.st"
      OUTPUT_IMAGE="$OUTPUT_PATH/$OUTPUT_NAME.image"
      OUTPUT_CHANGES="$OUTPUT_PATH/$OUTPUT_NAME.changes"
      OUTPUT_CACHE="$OUTPUT_PATH/package-cache"
      OUTPUT_DEBUG="$OUTPUT_PATH/PharoDebug.log"
      OUTPUT_PACKAGES="$OUTPUT_PATH/packages"
      TEMPORARY_OUTPUT_IMAGE="$OUTPUT_PATH/temp.image"
      TEMPORARY_OUTPUT_CHANGES="$OUTPUT_PATH/temp.changes"
    ;;

    # script
    s)  if [ -f "$SCRIPTS_PATH/$OPTARG.st" ] ; then
                SCRIPTS=("${SCRIPTS[@]}" "$SCRIPTS_PATH/$OPTARG.st")
      else
        echo "$(basename $0): invalid script ($OPTARG)"
        exit 1
      fi
    ;;

    # temporary script
    c)  if [ -f "$SCRIPTS_PATH/$OPTARG.st" ] ; then
                TEMPORARY_SCRIPTS=("${TEMPORARY_SCRIPTS[@]}" "$SCRIPTS_PATH/$OPTARG.st")
      else
        echo "$(basename $0): invalid temporary script ($OPTARG)"
        exit 1
      fi
    ;;

    # show help
    \?) display_help
      exit 1
    ;;

  esac
done

# check required parameters
if [ -z "$INPUT_IMAGE" ] ; then
  echo "$(basename $0): no input product name given"
  exit 1
fi

if [ -z "$OUTPUT_IMAGE" ] ; then
  echo "$(basename $0): no output product name given"
  exit 1
fi

# prepare output path
if [ -d "$OUTPUT_PATH" ] ; then
  rm -rf "$OUTPUT_PATH"
fi
mkdir -p "$OUTPUT_PATH"
mkdir -p "$BUILD_CACHE/${JOB_NAME:=$OUTPUT_NAME}"
ln -s "$BUILD_CACHE/${JOB_NAME:=$OUTPUT_NAME}" "$OUTPUT_CACHE"

ln -s "$SOURCES_PATH/PharoV10.sources" "$OUTPUT_PATH"

mkdir -p "$SUPPORT_PATH"
cp -r "$SUPPORT_PATH"/* "$OUTPUT_PATH"/

# find "$SOURCES_PATH" -name "*.sources" -exec ln "{}" "$OUTPUT_PATH/" \;

if [ -n "$TEMPORARY_IMAGE" ] ; then
  cp "$TEMPORARY_IMAGE" "$TEMPORARY_OUTPUT_IMAGE"
  cp "$TEMPORARY_CHANGES" "$TEMPORARY_OUTPUT_CHANGES"
fi

for FILE in "${TEMPORARY_SCRIPTS[@]}" ; do
  exec "$PHARO_VM" $PHARO_PARAM "$TEMPORARY_OUTPUT_IMAGE" "$FILE" &

  # wait for the process to terminate, or a debug log
  if [ $! ] ; then
    while kill -0 $! 2> /dev/null ; do
      if [ -f "$OUTPUT_DEBUG" ] ; then
        sleep 5
        kill -s SIGKILL $! 2> /dev/null
        echo "$(basename $0): error loading code ($PHARO_VM)"
        cat "$OUTPUT_DEBUG" | tr '\r' '\n' | sed 's/^/  /'
        exit 1
      fi
      sleep 1
    done
  else
    echo "$(basename $0): unable to start VM ($PHARO_VM)"
    exit 1
  fi
done

# prepare image file and sources
cp "$INPUT_IMAGE" "$OUTPUT_IMAGE"
cp "$INPUT_CHANGES" "$OUTPUT_CHANGES"
# prepare script file
###SCRIPTS=("${SCRIPTS[@]}" "$SCRIPTS_PATH/after.st")

for FILE in "${SCRIPTS[@]}" ; do
  exec "$PHARO_VM" $PHARO_PARAM "$OUTPUT_IMAGE" "$FILE" &

  # wait for the process to terminate, or a debug log
  if [ $! ] ; then
    while kill -0 $! 2> /dev/null ; do
      if [ -f "$OUTPUT_DEBUG" ] ; then
        sleep 5
        kill -s SIGKILL $! 2> /dev/null
        echo "$(basename $0): error loading code ($PHARO_VM)"
        cat "$OUTPUT_DEBUG" | tr '\r' '\n' | sed 's/^/  /'
        exit 1
      fi
      sleep 1
    done
  else
    echo "$(basename $0): unable to start VM ($PHARO_VM)"
    exit 1
  fi
done

if [ -n "$TEMPORARY_IMAGE" ] ; then
  rm "$TEMPORARY_OUTPUT_IMAGE"
  rm "$TEMPORARY_OUTPUT_CHANGES"
fi

# remove cache link
rm -f "$OUTPUT_CACHE"
rm -f "$OUTPUT_PATH/*.sources"

# success
exit 0
