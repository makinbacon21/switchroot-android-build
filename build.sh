#!/bin/bash

mkdir -p /root/android/lineage/out/target/product/foster_tab/vendor/lib/modules

cd /root/android/lineage
source build/envsetup.sh
export USE_CCACHE=1
ccache -M 50G
lunch lineage_foster_tab-userdebug

sed -i '/BOARD_KERNEL_IMAGE_NAME := zImage/a BOARD_MKBOOTIMG_ARGS    += --cmdline " "' ~/android/lineage/device/nvidia/foster/BoardConfig.mk

make bootimage -j$(nproc) && make vendorimage -j$(nproc) && make systemimage -j$(nproc)