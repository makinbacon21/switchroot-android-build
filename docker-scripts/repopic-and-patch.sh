#!/bin/bash

cd ${BUILDBASE}/android/lineage/
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-enhancements-p
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-shieldtech-p
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-beyonder-p
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-nvgpu-p
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t joycon-p
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t icosa-bt
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py 272671
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t backuptool-cleanup-p

cd ${BUILDBASE}/android/lineage/frameworks/base
patch -p1 < ${BUILDBASE}/android/lineage/.repo/local_manifests/patches/frameworks_base-rsmouse.patch

if [[ $ROM_NAME != "icosa" ]]; then
    cd ${BUILDBASE}/android/lineage/device/nvidia/foster_tab
    patch -p1 < ${BUILDBASE}/android/lineage/.repo/local_manifests/patches/device_nvidia_foster_tab-beyonder.patch
fi
