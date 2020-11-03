#!/bin/bash
cd ${BUILDBASE}/android/lineage

export WITH_TWRP=true
source build/envsetup.sh
export USE_CCACHE=1
ccache -M 50G

lunch lineage_$ROM_NAME-eng

sed -i '/BOARD_KERNEL_IMAGE_NAME := zImage/a BOARD_MKBOOTIMG_ARGS    += --cmdline " "' ${BUILDBASE}/android/lineage/device/nvidia/foster/BoardConfig.mk
sed -i -E 's/^(BOARD_KERNEL_BASE\s+:=\s+0x80080000)/\#\1/' ${BUILDBASE}/android/lineage/device/nvidia/foster/BoardConfig.mk

JOBS=$(($(nproc) + 1))

make -j${JOBS} recoveryimage
