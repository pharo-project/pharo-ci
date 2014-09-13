#!/usr/bin/env bash

set -ex

WORKSPACE=${WORKSPACE:-$(pwd)}

cd "$WORKSPACE"
# Set environment ============================================================
ZIP_FILTER='*'

# Download the latest sources ================================================
wget --quiet files.pharo.org/vm/src/vmmaker-image.zip
wget --quiet files.pharo.org/vm/src/cog.tar.gz

# Unpack sources =============================================================
tar -xzf cog.tar.gz
mkdir -p cog/build
mkdir -p cog/image

cd cog/image
unzip -o ../../vmmaker-image.zip

# Generate sources ===========================================================
cat > packaging.cs <<EOF
'From Pharo3.0 of 18 March 2013 [Latest update: #30852] on 4 August 2014 at 3:14:39.778255 pm'!

!PharoVMBuilder methodsFor: 'building' stamp: 'DamienCassou 8/4/2014 15:08'!
buildSourcesForDistroPackaging
	CogNativeBoostPlugin setTargetPlatform: #Linux32PlatformId.
	
	PharoUnixConfig new
		addExternalPlugins: #( FT2Plugin SqueakSSLPlugin );
		addInternalPlugins: #( UnixOSProcessPlugin  );
		generateSources; 
		generate.
! !


!PharoVMBuilder class methodsFor: 'building' stamp: 'DamienCassou 8/4/2014 15:07'!
buildSourcesForDistroPackaging
	^ self new buildSourcesForDistroPackaging! !
EOF


cat > ./script.st <<EOF
'packaging.cs' asFileReference fileIn.
PharoVMBuilder buildSourcesForDistroPackaging.
Smalltalk snapshot: false andQuit: true.
EOF

wget -O- get.pharo.org/vm | bash
./pharo generator.image script.st || (cat stderr; exit 1)

cd ../

pwd
for file in "$WORKSPACE"/pharo-ci/ci-jobs/Pharo-vm-unix-sources/patches/*; do
    patch -p1 < $file
done

vm_version=$(cat build/vmVersionInfo.h | sed -e 's/^.* Date: \([-0-9]*\) .*$/\1/' | tr - .)
cd ..
mv cog pharo-vm-${vm_version}
tar cjf pharo-vm-${vm_version}.tar.bz2 pharo-vm-${vm_version}

md5sum pharo-vm-${vm_version}.tar.bz2 > pharo-vm-${vm_version}.tar.bz2.md5sum
