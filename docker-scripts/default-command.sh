#!/bin/bash

if [ "$(ls -A ./android/lineage)" ]; then
    echo "Sources found. Skipping..."
else
    echo "Getting sources..."
    ACTION="default"
    ./get-sources.sh
fi

if [ "$ACTION" != "noupdate" ]; then
    ./reset-changes-update-sources.sh
    ./repopic-and-patch.sh
fi

if [ "$ACTION" != "nobuild" ]; then
    ./build.sh
fi
