#!bash -lex
#
# build-vm.sh -- Builds Cog Virtual Machine. Have to be used together with Jenkins.
#
# Copyright (c) 2012 Christophe Demarey
#


cd "$WORKSPACE"

# unzip VM into WORKSPACE/vm dir

unzip -j -o -d "$WORKSPACE/vm" "$WORKSPACE/vm/StackVM-${OS}.zip"


# generate small script to print VM version information

PHARO_VM="$WORKSPACE/vm/StackVM"
 
cd images
echo "
(FileStream forceNewFileNamed: 'vmVersion.txt')
nextPutAll: Smalltalk vm version ; cr;
close.

Smalltalk snapshot: false andQuit: true." > ./script.st
"$PHARO_VM" -headless "$WORKSPACE/images/Pharo-1.4.image" script.st -headless


# run tests
cd "$WORKSPACE"
./build.sh -i Pharo-1.4 -s testrunner -s delHDLintReport -s runalltests -o TestResults

# success
exit 0
