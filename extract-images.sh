#!/bin/bash

if [ "x$1" == "x"  ];
then
    echo "Missing rom name. Expected icosa | foster | foster_tab"
    exit 1
else
    echo "Rom name: $1"
    ROM_NAME=$1
fi

mkdir -p ~/Downloads/images

mkdir -p ./extract
echo "Copying zip..."
cp ./android/lineage/out/target/product/$ROM_NAME/lineage-16.0-*-UNOFFICIAL-$ROM_NAME.zip ./extract 
echo "Copying dtb..."
cp ./android/lineage/out/target/product/$ROM_NAME/obj/KERNEL_OBJ/arch/arm64/boot/dts/tegra210-icosa.dtb ./extract
echo "Moving to ~/Downloads/images..."
mv ./extract/* ~/Downloads/images/
rm -rf ./extract
