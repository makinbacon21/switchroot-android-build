#!/bin/bash

JOBS=$(($(nproc) + 1))

echo lineage_$ROM_NAME-userdebug

cd ${BUILDBASE}/android/lineage
source build/envsetup.sh
export USE_CCACHE=1
ccache -M 50G
lunch lineage_$ROM_NAME-userdebug

sed -i '/BOARD_KERNEL_IMAGE_NAME := zImage/a BOARD_MKBOOTIMG_ARGS    += --cmdline " "' ~/android/lineage/device/nvidia/foster/BoardConfig.mk
sed -i -E 's/^(BOARD_KERNEL_BASE\s+:=\s+0x80080000)/\#\1/' ~/android/lineage/device/nvidia/foster/BoardConfig.mk

if [ "$ROM_TYPE" == "zip" ]
  then
  nice make -j${JOBS} bacon
else
  nice make -j${JOBS} bootimage && nice make -j${JOBS} vendorimage && nice make -j${JOBS} systemimage
fi
