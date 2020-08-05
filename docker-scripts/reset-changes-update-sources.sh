#!/bin/bash

JOBS=$(($(nproc) - 1)) # Google guidelines for `repo`

cd /build/android/lineage
repo forall -c 'git reset --hard'

cd .repo/local_manifests
git pull

cd ../..

repo sync -j${JOBS}
