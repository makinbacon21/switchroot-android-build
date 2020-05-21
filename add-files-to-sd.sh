#!/bin/bash

if [ "x$1" == "x"  ];
then
    echo "Missing rom name. Expected icosa | foster | foster_tab"
    exit 1
else
    echo "Rom name: $1"
    ROM_NAME=$1
fi

if [ "x$2" == "x"  ];
then
    echo "Missing SD card mount point. Usage: ./add-files-to-sd.sh <rom_name> <mount_point>"
    exit 1
else
    echo "SD Mount point: $2"
    MOUNT_POINT=$2
fi

./extract-images.sh $ROM_NAME

ZIP_FILE=$(ls -rt ./extract/*.zip | tail -1)

echo "Creating switchroot install dir..."
mkdir -p $MOUNT_POINT/switchroot/install
echo "Copying build zip to SD Card..."
cp $ZIP_FILE $MOUNT_POINT/
echo "Copying build dtb to SD Card..."
cp ./extract/tegra210-icosa.dtb $MOUNT_POINT/switchroot/install/
echo "Copying twrp to SD Card..."
cp ./external/twrp.img $MOUNT_POINT/switchroot/install
