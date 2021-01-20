#!/bin/bash

cd ${BUILDBASE}/android/lineage/
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-enhancements-q
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t icosa-bt-lineage-17.1
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-shieldtech-q
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-beyonder-q
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py 300860
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py 287339
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py 284553

function applyPatches {
    PATCHES_FILE=$1

    while read -r line; do
        IFS=':' read -r -a parts <<< "$line"
        echo "Applying patch ${parts[1]}"
        eval "patch -p1 -d ${parts[0]} -i ${parts[1]}"
    done < $PATCHES_FILE
} 

applyPatches "${BUILDBASE}/default-patches.txt"

cd ${BUILDBASE}/android/lineage/frameworks/native
git apply < ${BUILDBASE}/android/lineage/.repo/local_manifests/patches/vendor_firmware_icosa.patch
cd ${BUILDBASE}/android/lineage/

if [[ -f "$EXTRA_CONTENT/patches.txt" ]]; then
    applyPatches "$EXTRA_CONTENT/patches.txt"
fi

### TEMPORARY PATCH UNTIL THERE IS AN UPDATED TWRP
echo "Reverting 0e1c660d commit to support older TWRP"
cd ${BUILDBASE}/android/lineage/device/nvidia/foster
git revert 0e1c660d -n
