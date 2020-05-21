#!/bin/bash

cd /root/android/lineage/
/root/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-enhancements-p
/root/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-shieldtech-p
/root/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-beyonder-p
/root/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-nvgpu-p
/root/android/lineage/vendor/lineage/build/tools/repopick.py -t joycon-p
/root/android/lineage/vendor/lineage/build/tools/repopick.py -t icosa-bt
/root/android/lineage/vendor/lineage/build/tools/repopick.py 272671
/root/android/lineage/vendor/lineage/build/tools/repopick.py -t backuptool-cleanup-p

cd /root/android/lineage/frameworks/base
patch -p1 < ../../.repo/local_manifests/patches/frameworks_base-rsmouse.patch

cd /root/android/lineage/device/nvidia/foster_tab
patch -p1 < ../../../.repo/local_manifests/patches/device_nvidia_foster_tab-beyonder.patch

cd /root/android/lineage/kernel/nvidia/cypress-fmac
patch -p1 < ../../../.repo/local_manifests/patches/kernel_nvidia_cypress-fmac.patch
