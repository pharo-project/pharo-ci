#!bash -lex

cd "$WORKSPACE"
# Set environment ============================================================
ZIP_FILTER='*'
if [ "$OS" == "win" ]; then
    set -e # Stop the execution if a command fails!
    ZIP_FILTER=' *.exe *.dll'
fi

# Download the latest sources ================================================
wget --quiet files.pharo.org/vm/src/spur/vmmaker-image.zip
wget --quiet files.pharo.org/vm/src/spur/cog.tar.gz

# Unpack sources =============================================================
tar -xzf cog.tar.gz || echo # echo needed for Windows build (error on symlinks creation)
mkdir -p cog/build
mkdir -p cog/image

cd cog/image
unzip -o ../../vmmaker-image.zip

# Generate sources ===========================================================
#wget -O- get.pharo.org/vm40 | bash
#wget -O pharovm-centos65.zip https://github.com/philippeback/pharovm-centos65/archive/master.zip
#unzip pharovm-centos65.zip
#mv pharovm-centos65-master/zeroconf-centos/* .
#rmdir pharovm-centos65-master/zeroconf-centos
# Only execute for a new slave
# cd pharovm-centos65-master
# sudo install-requisites.sh

wget -O vm.zip http://files.pharo.org/vm/pharo-spur32/linux/centos/latest.zip
unzip vm.zip
wget http://files.pharo.org/sources/PharoV50.sources.zip
unzip PharoV50.sources.zip
./pharo --nodisplay generator.image eval "PharoVMBuilder buildOnJenkins: '$OS'" || (cat stderr; exit 1)

cd "$WORKSPACE"
tar -czf sources.tar.gz -C cog .


# Compile ====================================================================
cd cog/build
sh build.sh


# Archive ====================================================================
cd "$WORKSPACE/cog/results"

zip -r "vm.zip" $ZIP_FILTER

cp -f vm.zip ../../"${BUILD_NUMBER}.zip"
cp -f vm.zip ../../"latest.zip"
mv -f vm.zip ../../"Pharo-VM-${OS}-latest.zip"

# success
exit 0
