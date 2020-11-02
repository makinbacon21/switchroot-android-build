#!/bin/bash

JOBS=$(($(nproc) - 1)) # Google guidelines for `repo`

cd ${BUILDBASE}/android/lineage/bootable/
rm -rf ./recovery/ # Delete it, just in case it was repleaced by twrp

cd ${BUILDBASE}/android/lineage
repo forall -c 'git reset --hard'

cd .repo/local_manifests
git pull

cd ../..

repo sync --force-sync -j${JOBS}
