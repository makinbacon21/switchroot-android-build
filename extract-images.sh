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

CONTAINER=$(docker run --rm -ti -e ROM_NAME=$ROM_NAME -v "$PWD"/android:/root/android switchroot:build-android)
docker exec $CONTAINER bash -c "mkdir /extract"
docker exec $CONTAINER bash -c "cp /root/android/lineage/out/target/product/$ROM_NAME/lineage-16.0-*-UNOFFICIAL-$ROM_NAME.zip /extract" 
docker exec $CONTAINER bash -c "cp /root/android/lineage/out/target/product/$ROM_NAME/obj/KERNEL_OBJ/arch/arm64/boot/dts/tegra210-icosa.dtb /extract"

docker cp $CONTAINER:/extract ~/Downloads/images

docker rm -f $CONTAINER
