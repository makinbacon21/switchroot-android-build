#!/bin/bash

mkdir -p ~/Downloads/images

CONTAINER=$(docker run -d -i switchroot:build-latest)
docker exec $CONTAINER bash -c "mkdir /extract-latest"
docker exec $CONTAINER bash -c "mv /root/android/lineage/out/target/product/icosa/lineage-16.0-*-UNOFFICIAL-icosa.zip /extract-latest" 
docker exec $CONTAINER bash -c "mv /root/android/lineage/out/target/product/icosa/obj/KERNEL_OBJ/arch/arm64/boot/dts/tegra210-icosa.dtb /extract-latest"

docker cp $CONTAINER:/extract-latest ~/Downloads/images

docker rm -f $CONTAINER
