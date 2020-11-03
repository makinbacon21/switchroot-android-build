#!/bin/bash

JOBS=$(($(nproc) - 1)) # Google guidelines for `repo`

cd ${BUILDBASE}/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-17.1
repo sync --force-sync -j${JOBS}

cd ${BUILDBASE}/android/lineage/.repo
git clone https://gitlab.com/switchroot/android/manifest.git -b lineage-17.1 local_manifests

repo sync --force-sync -j${JOBS}
