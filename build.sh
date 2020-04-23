#!/bin/bash

echo lineage_$ROM_NAME-userdebug

cd /root/android/lineage
source build/envsetup.sh
export USE_CCACHE=1
ccache -M 50G
#lunch lineage_$ROM_NAME-userdebug

sed -i '/BOARD_KERNEL_IMAGE_NAME := zImage/a BOARD_MKBOOTIMG_ARGS    += --cmdline " "' ~/android/lineage/device/nvidia/foster/BoardConfig.mk

#make bacon