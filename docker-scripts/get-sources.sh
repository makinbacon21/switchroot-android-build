#!/bin/bash

JOBS=$(($(nproc) - 1)) # Google guidelines for `repo`

cd ${BUILDBASE}/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-17.1
repo sync -j${JOBS}

cd ${BUILDBASE}/android/lineage/.repo
# UNCOMMENT THIS WHEN THE 17.1 BRANCH BECOMES AVAILABLE AND DELETE THE HARDCODED MANIFEST
# git clone https://gitlab.com/switchroot/android/manifest.git -b lineage-17.1 local_manifests
rm -rf ./local_manifests
mkdir -p local_manifests/patches
cp ${BUILDBASE}/switch.xml ./local_manifests/switch.xml
cp ${BUILDBASE}/bionic_intrinsics.patch ./local_manifests/patches/bionic_intrinsics.patch
cp ${BUILDBASE}/disable_selinux.patch ./local_manifests/patches/disable_selinux.patch

repo sync -j${JOBS}
