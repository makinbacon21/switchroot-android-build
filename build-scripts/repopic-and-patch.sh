#!/bin/bash

cd ${BUILDBASE}/android/lineage/
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-enhancements-q
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t nvidia-nvgpu-q
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py -t icosa-bt-lineage-17.1
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py 287339
${BUILDBASE}/android/lineage/vendor/lineage/build/tools/repopick.py 284553

function applyPatches {
    PATCHES_FILE=$1

    while read -r line; do
        IFS=':' read -r -a parts <<< "$line"
        eval "patch -p1 -d ${parts[0]} -i ${parts[1]}"
    done < $PATCHES_FILE
} 

applyPatches "${BUILDBASE}/default-patches.txt"

if [[ -f "$EXTRA_CONTENT/patches.txt" ]]; then
    applyPatches "$EXTRA_CONTENT/patches.txt"
fi
