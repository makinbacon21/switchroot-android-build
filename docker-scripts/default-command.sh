#!/bin/bash

cd ${BUILDBASE}

if [ "$(ls -A ./android/lineage)" ]; then
    echo "Sources found. Skipping..."
else
    echo "Getting sources..."
    ./get-sources.sh
fi

if [[ -z $FLAGS || ! -z ${FLAGS##*noupdate*} ]]; then
    cd ${BUILDBASE}
    ./reset-changes-update-sources.sh
    ./repopic-and-patch.sh
fi

if [[ -z $FLAGS || ! -z ${FLAGS##*nobuild*} ]]; then
    cd ${BUILDBASE}
    ./build.sh
fi

if [[ "$ROM_TYPE" == "zip" ]]; then
    if [[ -z $FLAGS || ! -z ${FLAGS##*nooutput*} ]]; then
        echo "Copying output to ./android/output..."
        cd ${BUILDBASE}
        ./copy-to-output.sh
    fi
fi