#
# fetchLatestVM.sh -- Get the latest Virtual Machine from Jenkins.
#
# Copyright (c) 2012 Christophe Demarey
#

# -------------------------------------------------------------------------

if [ -z "$OS" ] ; then
    #try to extract the os name
    TMP_OS=`uname | tr '[:upper:]' '[:lower:]'`
    if [[ "{$TMP_OS}" = *windows* ]]; then
        OS='win'
    elif [[ "{$TMP_OS}" = *darwin* ]]; then
        OS='mac'
    elif [[ "{$TMP_OS}" = *linux* ]]; then
        OS='linux'
    fi
fi

if [ -z "$OS" ] ; then
    echo "OS environment variable is not set."  1>&2
    exit 1
fi

# -------------------------------------------------------------------------
if [ -z "$ARCHITECTURE" ] ; then
	  echo "Architecture environment variable is not set. Defaulting to x86 32 bit"  1>&2
    ARCHITECTURE=32
fi

if [ -z "$WORKSPACE" ] ; then
	WORKSPACE=`pwd`
fi

DIR=`dirname "$0"`;

# -------------------------------------------------------------------------
VM_BASE_URL="https://ci.inria.fr/pharo/view/Cog/job/PharoVM"
VM_URL="${VM_BASE_URL}/Architecture=${ARCHITECTURE},OS=${OS}/lastSuccessfulBuild/artifact/Pharo-${OS}.zip"

VM_DIR="$WORKSPACE/vm"
rm -rf "$VM_DIR"
mkdir -p "$VM_DIR"

sh "$DIR/../download.sh" "$VM_DIR/vm.zip" $VM_URL

unzip -qjo -d "$VM_DIR" "$VM_DIR/vm.zip"

cd "$VM_DIR"

if [ "$OS" == "win" ]; then
    PHARO_VM_EXEC=`find . -name Pharo.exe`
elif [ "$OS" == "unix" ]; then
    PHARO_VM_EXEC=`find . -name pharo`
else
    PHARO_VM_EXEC=`find . -name Pharo`
fi
export PHARO_VM=`pwd`"/$PHARO_VM_EXEC"
echo $PHARO_VM

cd - > /dev/null
