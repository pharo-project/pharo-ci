#!/bin/bash

# stop the script if a single command fails
set -e 

# ARHUMENT HANDLING ===========================================================

if [[ "$1" = "-h" || "$1" = "--help" ]];then
    echo "This is an entry point script for any Pharo image CI
This script will download the latest Pharo 2.0 image and the latest VM

Result in the current directory:
    vm               directory containing the VM
    vm.sh            script forwarding to the VM inside vm/
    Pharo.image      The latest pharo image
    Pharo.changes    The corresponding pharo changes"
    exit 0
elif [[ $# -gt 0 ]];then
    echo "--help is the only argument allowed"
    exit 1
fi


# SYSTEM PROPERTIES ===========================================================
if [ -z "$OS" ] ; then
    #try to extract the os name
    TMP_OS=`uname | tr '[:upper:]' '[:lower:]'`
    if [[ "{$TMP_OS}" = *windows* ]]; then
        OS='win'
    elif [[ "{$TMP_OS}" = *darwin* ]]; then
        OS='mac'
    elif [[ "{$TMP_OS}" = *linux* ]]; then
        OS='linux'
    else
        echo "Unsupported OS"
        exit 1
    fi
fi


if [ -z "$ARCHITECTURE" ] ; then
    echo "Architecture environment variable is not set. Defaulting to x86 32 bit"  1>&2
    ARCHITECTURE=32
fi

# DOWNLOAD THE LATEST VM ======================================================
VM_URL="http://pharo.gforge.inria.fr/ci/vm/cog/${OS}/Cog-${OS}-latest.zip"

curl --output vm.zip $VM_URL

unzip -qjo -d vm vm.zip

if [ "$OS" == "win" ]; then
    PHARO_VM=`find vm -name CogVM.exe`
else
    PHARO_VM=`find vm -name CogVM`
fi

echo $PHARO_VM

# create a local executable file which forwads to the found vm
echo "#!/bin/bash" > vm.sh
echo '# some magic to find out the real location of this script
DIR=`readlink "$0"` || DIR="$0";
DIR=`dirname "$DIR"`;
cd "$DIR"
DIR=`pwd`
cd - > /dev/null 
# run the VM' >> vm.sh
# make sure we only substite $PHARO_VM but put '$DIR' in the script
echo \"\$DIR\"/\"$PHARO_VM\" -headless \$* >> vm.sh

# make the script executable
chmod +x vm.sh

# DOWNLOAD THE LATEST IMAGE ===================================================
IMAGE_URL="http://pharo.gforge.inria.fr/ci/image/20/latest.zip"
curl --output image.zip $IMAGE_URL

IMAGE_DIR="image"
mkdir $IMAGE_DIR

unzip -d $IMAGE_DIR image.zip

# find the image name
PHARO_IMAGE=`find $IMAGE_DIR -name *.image`
PHARO_CHANGES=`find $IMAGE_DIR -name *.changes`

# rename
mv "$PHARO_IMAGE" Pharo.image
mv "$PHARO_CHANGES" Pharo.changes

# CLEANUP =====================================================================
rm -rf image image.zip vm.zip

echo Pharo.image
echo Pharo.changes
