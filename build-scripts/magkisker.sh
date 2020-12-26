#!/bin/bash/
svn checkout https://github.com/makinbacon21/switchroot-script-builder/trunk/magisk # get magisk stuff

export RECOVERYMODE=true # use recovery mode flag because apparently that works

# patch and replace boot.img
bash ./magisk/boot_patch.sh $BUILDBASE/android/output/switchroot/install/boot.img
cd $BUILDBASE/android/output/switchroot/install/
rm boot.img
mv ./magisk/new-boot.img $BUILDBASE/android/output/switchroot/install/boot.img

zip -u $OUTPUT_ZIP_FILE boot.img # zip patched boot.img into lineage zip