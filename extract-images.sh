#!/bin/bash

## This script extracts the build output to ./extract

if [ "x$1" == "x"  ];
then
    echo "Missing rom name. Expected icosa | foster | foster_tab"
    exit 1
else
    echo "Rom name: $1"
    ROM_NAME=$1
fi

mkdir -p ./extract
if ls ./android/lineage/out/target/product/$ROM_NAME/lineage-16.0-*-UNOFFICIAL-$ROM_NAME.zip 1> /dev/null 2>&1;
    then
    echo "Copying zip..."
    cp ./android/lineage/out/target/product/$ROM_NAME/lineage-16.0-*-UNOFFICIAL-$ROM_NAME.zip ./extract
fi

if test -f "./android/lineage/out/target/product/$ROM_NAME/obj/KERNEL_OBJ/arch/arm64/boot/dts/tegra210-icosa.dtb"
    then
    echo "Copying dtb..."
    cp ./android/lineage/out/target/product/$ROM_NAME/obj/KERNEL_OBJ/arch/arm64/boot/dts/tegra210-icosa.dtb ./extract
fi

if test -f "./android/lineage/out/target/product/$ROM_NAME/vendor.img"
    then echo "Copying vendor..."
    cp ./android/lineage/out/target/product/$ROM_NAME/vendor.img ./extract
fi

if test -f "./android/lineage/out/target/product/$ROM_NAME/boot.img"
    then echo "Copying boot..."
    cp ./android/lineage/out/target/product/$ROM_NAME/boot.img ./extract
fi

if test -f "./android/lineage/out/target/product/$ROM_NAME/system.img"
    then echo "Copying system..."
    cp ./android/lineage/out/target/product/$ROM_NAME/system.img ./extract
fi

if test -f "./android/lineage/out/target/product/$ROM_NAME/recovery.img"
    then echo "Copying recovery..."
    cp ./android/lineage/out/target/product/$ROM_NAME/recovery.img ./extract
fi

echo "Build extracted to ./extract"
