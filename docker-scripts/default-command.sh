#!/bin/bash

if [ "$(ls -A ./android/lineage)" ]; then
    echo "Sources found. Skipping..."
else
    echo "Getting sources..."
    ./get-sources.sh
fi

./reset-changes-update-sources.sh
./repopic-and-patch.sh
./build.sh
