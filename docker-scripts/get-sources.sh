#!/bin/bash

cd /root/android/lineage
repo init --depth=1 -u https://github.com/LineageOS/android.git -b lineage-16.0
repo sync -c -j16

cd /root/android/lineage/.repo
git clone --depth 1 https://gitlab.com/switchroot/android/manifest.git local_manifests
repo sync -c -j16
