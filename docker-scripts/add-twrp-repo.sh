#!/bin/bash

cd ${BUILDBASE}/android/lineage/bootable/
mv ./recovery ${BUILDBASE}/android/recovery-backup
git clone https://github.com/TeamWin/android_bootable_recovery recovery
cd recovery/
git fetch "https://gerrit.twrp.me/android_bootable_recovery" refs/changes/17/2017/2 && git cherry-pick FETCH_HEAD
git fetch "https://gerrit.twrp.me/android_bootable_recovery" refs/changes/18/2018/2 && git cherry-pick FETCH_HEAD
