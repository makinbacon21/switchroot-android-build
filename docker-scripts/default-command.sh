#!/bin/bash

if [ "$(ls -A ./android/lineage)" ]; then
    echo "Sources found. Skipping..."
else
    echo "Getting sources..."
    ./get-sources.sh
fi

if [ ! -z ${FLAGS##*noupdate*} ]; then
    ./reset-changes-update-sources.sh
    ./repopic-and-patch.sh
fi

if [ ! -z ${FLAGS##*nobuild*} ]; then
    ./build.sh
fi
