#!/bin/bash

cd ${BUILDBASE}/android/lineage/
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-enhancements-q
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-nvgpu-q
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-shieldtech-q
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t icosa-bt-lineage-17.1
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py 287339
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py 284553

# Temporary patch to use current coreboot
wget -O .repo/android_device_nvidia_foster.patch https://gitlab.com/ZachyCatGames/q-tips-guide/-/raw/master/res/android_device_nvidia_foster.patch
cd ${BUILDBASE}/android/lineage/device/nvidia/foster
patch -p1 < ${BUILDBASE}/android/lineage/.repo/android_device_nvidia_foster.patch
rm ${BUILDBASE}/android/lineage/.repo/android_device_nvidia_foster.patch

cd ${BUILDBASE}/android/lineage/bionic
patch -p1 < ${BUILDBASE}/android/lineage/.repo/local_manifests/patches/bionic_intrinsics.patch

cd ${BUILDBASE}/android/lineage/kernel/nvidia/cypress-fmac
patch -p1 < ${BUILDBASE}/android/lineage/.repo/local_manifests/patches/kernel_nvidia_cypress-fmac.patch
