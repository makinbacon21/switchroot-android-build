#!/bin/bash

JOBS=$(($(nproc) - 1)) # Google guidelines for `repo`

cd ${BUILDBASE}/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-17.1
repo sync -j${JOBS}

cd ${BUILDBASE}/android/lineage/.repo
# UNCOMMENT THIS WHEN THE 17.1 BRANCH BECOMES AVAILABLE AND DELETE THE HARDCODED MANIFEST
# git clone https://gitlab.com/switchroot/android/manifest.git -b lineage-17.1 local_manifests
mkdir local_manifests
cp ${BUILDBASE}/switch.xml ./local_manifests/switch.xml

repo sync -j${JOBS}
