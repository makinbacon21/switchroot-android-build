#!/bin/bash

if [ "x$DOCKER_IMAGE_TAG" == "x"  ];
then
    DOCKER_IMAGE_TAG=build
fi

echo "Image tag: $DOCKER_IMAGE_TAG"

if [ "x$1" == "x"  ];
then
    echo "Missing rom name. Expected icosa | foster | foster_tab"
    exit 1
else
    echo "Rom name: $1"
fi

mkdir -p ~/Downloads/images

CONTAINER=$(docker run -d -i switchroot:$DOCKER_IMAGE_TAG)
docker exec $CONTAINER bash -c "mkdir /extract"
docker exec $CONTAINER bash -c "mv /root/android/lineage/out/target/product/$1/lineage-16.0-*-UNOFFICIAL-$1.zip /extract" 
docker exec $CONTAINER bash -c "mv /root/android/lineage/out/target/product/$1/obj/KERNEL_OBJ/arch/arm64/boot/dts/tegra210-icosa.dtb /extract"

docker cp $CONTAINER:/extract ~/Downloads/images

docker rm -f $CONTAINER
