#!/bin/bash

# stop the script if a single command fails
set -e 

# ARHUMENT HANDLING ===========================================================

if { [ "$1" = "-h" ] || [ "$1" = "--help" ]; }; then
    echo "This script will download the latest Pharo VM

Result in the current directory:
    vm               directory containing the VM
    vm.sh            script forwarding to the VM inside vm"
    exit 0
elif [ $# -gt 0 ]; then
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
    ARCHITECTURE=32
fi

# DOWNLOAD THE LATEST VM ======================================================
VM_URL="http://pharo.gforge.inria.fr/ci/vm/pharo/${OS}/pharo-${OS}-latest.zip"

wget --progress=bar:force --output-document=vm.zip $VM_URL

unzip -qo -d vm vm.zip

if [ "$OS" == "win" ]; then
    PHARO_VM=`find vm -name Pharo.exe`
elif [ "$OS" == "mac" ]; then
    PHARO_VM=`find vm -name Pharo`
elif [ "$OS" == "linux" ]; then
    PHARO_VM=`find vm -name pharo`
fi

echo $PHARO_VM

# DOWNLOAD THE PharoV10.sources ===============================================
SOURCES_URL="http://pharo.gforge.inria.fr/ci/image/PharoV10.sources.zip"
wget --progress=bar:force --output-document=sources.zip $SOURCES_URL
unzip -qo -d vm sources.zip
rm -rf sources.zip

# create a local executable file which forwads to the found vm ================
echo "#!/bin/bash" > vm.sh
echo '# some magic to find out the real location of this script dealing with symlinks
DIR=`readlink "$0"` || DIR="$0";
DIR=`dirname "$DIR"`;
cd "$DIR"
DIR=`pwd`
cd - > /dev/null 
# disable parameter expansion to forward all arguments unprocess to the VM
set -f
# run the VM and pass along all arguments as is' >> vm.sh
# make sure we only substite $PHARO_VM but put '$DIR' in the script
echo -n \"\$DIR\"/\"$PHARO_VM\" >> vm.sh
if [ "$OS" == "linux" ]; then
    echo -n " -vm-display-null " >> vm.sh
else
    echo -n " -headless" >> vm.sh
fi
echo " \"\$@\"" >> vm.sh

# make the script executable
chmod +x vm.sh

# cleanup =====================================================================
rm -rf vm.zip
