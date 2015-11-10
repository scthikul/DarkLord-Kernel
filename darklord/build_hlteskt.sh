#!/bin/bash
export KERNEL_VARIANT="hlteskt"
VARIANT_DEFCONFIG=msm8974_sec_hlte_skt_defconfig

export ARCH=arm
export CROSS_COMPILE=/home/.android/Toolchain/arm-eabi-5.1/bin/arm-eabi-
export KERNEL_VERSION=$(cat version)
export KERNEL_NAME=$(cat kernelname)
export DARKLORD_FULLVER=$KERNEL_NAME-$KERNEL_VARIANT-$KERNEL_VERSION
export DARKLORD_PATH=$(pwd)
export KBUILD_BUILD_USER="darkera13"
export KBUILD_BUILD_HOST="samsungviet.vn"

if [ "${1}" != "skip" ] ; then
	rm -Rf $DARKLORD_PATH/output
	mkdir $DARKLORD_PATH/output
fi

make -C $DARKLORD_PATH/.. O=$DARKLORD_PATH/output -j8 msm8974_sec_defconfig VARIANT_DEFCONFIG=$VARIANT_DEFCONFIG SELINUX_DEFCONFIG=selinux_defconfig
make -C $DARKLORD_PATH/.. O=$DARKLORD_PATH/output -j8

dtbTool -s 2048 -o $DARKLORD_PATH/dist/dt.img -p $DARKLORD_PATH/output/scripts/dtc/ $DARKLORD_PATH/output/arch/arm/boot/
cp $DARKLORD_PATH/output/arch/arm/boot/zImage $DARKLORD_PATH/dist/zImage

rm -Rf $DARKLORD_PATH/kernelzip/boot.img
mkboot $DARKLORD_PATH/dist $DARKLORD_PATH/kernelzip/boot.img
echo -n "SEANDROIDENFORCE" >> $DARKLORD_PATH/kernelzip/boot.img

rm -Rf $DARKLORD_PATH/release/$DARKLORD_FULLVER.zip
cd $DARKLORD_PATH/kernelzip/

if [ -d "$DARKLORD_PATH/kernelzip/system" ] 
then
	rm -Rf $DARKLORD_PATH/kernelzip/system/kernel.ota.prop
else
	mkdir $DARKLORD_PATH/kernelzip/system
fi

7z a -mx9 $DARKLORD_FULLVER-tmp.zip *
zipalign -v 4 $DARKLORD_FULLVER-tmp.zip $DARKLORD_PATH/release/$DARKLORD_FULLVER.zip
rm $DARKLORD_FULLVER-tmp.zip
cd ..
ls -al $DARKLORD_PATH/release/$DARKLORD_FULLVER.zip
