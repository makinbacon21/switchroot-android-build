#!/bin/bash

## This script copies the build output to the output dir
## so it can be used by hekate

./extract-images.sh $ROM_NAME

ZIP_FILE=$(ls -rt ./android/lineage/out/target/product/$ROM_NAME/lineage-16.0-*-UNOFFICIAL-$ROM_NAME.zip | tail -1)

echo "Creating switchroot install dir..."
mkdir -p ./android/output/switchroot/install
echo "Creating switchroot android dir..."
mkdir -p ./android/output/switchroot/android
echo "Creating bootloader config dir..."
mkdir -p ./android/output/bootloader/ini
echo "Copying build zip to SD Card..."
cp $ZIP_FILE ./android/output/
echo "Copying build combined kernel and ramdisk..."
cp ./android/lineage/out/target/product/$ROM_NAME/boot.img ./android/output/switchroot/install/
echo "Copying build dtb..."
cp ./android/lineage/out/target/product/$ROM_NAME/obj/KERNEL_OBJ/arch/arm64/boot/dts/tegra210-icosa.dtb ./android/output/switchroot/install/
echo "Downloading twrp..."
curl -o ./android/output/switchroot/install/twrp.img https://github.com/PabloZaiden/switchroot-android-build/raw/master/external/twrp.img
echo "Downloading coreboot.rom..."
curl -o ./android/output/switchroot/android/coreboot.rom https://cdn.discordapp.com/attachments/667093920005619742/702602200991662210/coreboot.rom
echo "Downloading 00-android.ini..."
curl -o ./android/output/bootloader/ini/00-android.ini https://gitlab.com/ZachyCatGames/shitty-pie-guide/-/raw/master/00-android.ini?inline=false
echo "Downloading boot scripts..."
curl -o ./android/output/switchroot/android/common.scr https://gitlab.com/switchroot/bootstack/switch-uboot-scripts/-/jobs/artifacts/master/raw/common.scr?job=build
curl -o ./android/output/switchroot/android/boot.scr https://gitlab.com/switchroot/bootstack/switch-uboot-scripts/-/jobs/artifacts/master/raw/sd.scr?job=build
