#!/bin/bash

if [ "x$DOCKER_IMAGE_TAG" == "x"  ];
then
    DOCKER_IMAGE_TAG=build
fi

echo "Image tag: $DOCKER_IMAGE_TAG"

mkdir -p ~/Downloads/images

CONTAINER=$(docker run -d -i switchroot:$DOCKER_IMAGE_TAG)
docker exec $CONTAINER bash -c "mkdir /extract"
docker exec $CONTAINER bash -c "mv /root/android/lineage/out/target/product/\$ROM_NAME/lineage-16.0-*-UNOFFICIAL-\$ROM_NAME.zip /extract" 
docker exec $CONTAINER bash -c "mv /root/android/lineage/out/target/product/\$ROM_NAME/obj/KERNEL_OBJ/arch/arm64/boot/dts/tegra210-icosa.dtb /extract"

docker cp $CONTAINER:/extract ~/Downloads/images

docker rm -f $CONTAINER
