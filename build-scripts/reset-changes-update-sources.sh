#!/bin/bash

JOBS=$(($(nproc) - 1)) # Google guidelines for `repo`

cd ${BUILDBASE}/android/lineage
repo forall -c 'git reset --hard'
repo forall -c 'git clean -fd'

cd .repo/local_manifests
git pull

cd ../..

repo sync --force-sync -j${JOBS}
