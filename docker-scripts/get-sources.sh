#!/bin/bash

JOBS=$(($(nproc) - 1)) # Google guidelines for `repo`

cd ${BUILDBASE}/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-16.0
repo sync -j${JOBS}

cd ${BUILDBASE}/android/lineage/.repo
git clone https://gitlab.com/switchroot/android/manifest.git local_manifests
repo sync -j${JOBS}
