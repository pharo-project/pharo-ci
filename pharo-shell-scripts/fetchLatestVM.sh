#
# fetchLatestVM.sh -- Get the latest Virtual Machine from Jenkins.
#
# Copyright (c) 2012 Christophe Demarey
#

if [ -z "$OS" ] ; then
	echo "OS environment variable is not set."
	exit 1
fi
if [ -z "$Architecture" ] ; then
	echo "Architecture environment variable is not set."
	exit 1
fi

if [ -z "$WORKSPACE" ] ; then
	WORKSPACE=.
fi

VM_BASE_URL="https://ci.lille.inria.fr/pharo/view/Cog/job/Cog-VM"
VM_URL="${VM_BASE_URL}/Architecture=${Architecture},OS=${OS}/lastSuccessfulBuild/artifact/Cog-${OS}.zip"

VM_DIR="$WORKSPACE/vm"
rm -rf "$VM_DIR"
mkdir -p "$VM_DIR"

sh "$WORKSPACE/download.sh" "$VM_DIR/vm.zip" $VM_URL

unzip -j -o -d "$VM_DIR" "$VM_DIR/vm.zip"

cd "$VM_DIR"

if [ "$OS" == "win" ]; then
    PHARO_VM=`find . -name CogVM.exe`
else
    PHARO_VM=`find . -name CogVM`
fi
export PHARO_VM="$VM_DIR/$PHARO_VM"

cd -