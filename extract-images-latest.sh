#!/bin/bash

mkdir -p ~/Downloads/images

CONTAINER=$(docker create switchroot:build-latest)
docker cp $CONTAINER:/root/android/lineage/out/target/product/foster_tab/boot.img ~/Downloads/images/boot.img
docker cp $CONTAINER:/root/android/lineage/out/target/product/foster_tab/vendor.img ~/Downloads/images/vendor.img
docker cp $CONTAINER:/root/android/lineage/out/target/product/foster_tab/system.img ~/Downloads/images/system.img
docker cp $CONTAINER:/root/android/lineage/out/target/product/foster_tab/obj/KERNEL_OBJ/arch/arm64/boot/dts/tegra210-icosa.dtb ~/Downloads/images/tegra210-icosa.dtb
docker rm $CONTAINER
