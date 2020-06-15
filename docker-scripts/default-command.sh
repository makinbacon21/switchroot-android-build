#!/bin/bash

if [ "$(ls -A ./android/lineage)" ]; then
    echo "Sources found. Skipping..."
else
    echo "Getting sources..."
    ./get-sources.sh
fi

if [[ -z $FLAGS || ! -z ${FLAGS##*noupdate*} ]]; then
    ./reset-changes-update-sources.sh
    ./repopic-and-patch.sh
fi

if [[ -z $FLAGS || ! -z ${FLAGS##*nobuild*} ]]; then
    ./build.sh
fi

if [[ "$ROM_TYPE" == "zip" ]]; then
    if [[ -z $FLAGS || ! -z ${FLAGS##*nooutput*} ]]; then
        echo "Copying output to ./android/output..."
        cd /root
        ./copy-to-output.sh
    fi
fi