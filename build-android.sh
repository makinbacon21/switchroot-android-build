#!/bin/bash

if [ "x$1" == "x"  ];
then
    echo "Missing rom name. Expected icosa | foster | foster_tab"
    exit 1
else
    echo "Rom name: $1"
    ROM_NAME=$1
fi

docker build -t switchroot:build-android ./docker-scripts
mkdir -p ./android/lineage

# TODO: Add condition to avoid getting sources if they are already there
if [ "$(ls -A ./android/lineage)" ]; then
    echo "Sources found. Skipping..."
else
    echo "Getting sources..."
    docker run --rm -ti -v $(pwd)/android:/root/android switchroot:build-android /root/get-sources.sh
fi

echo Building $ROM_NAME
docker run --rm -ti -e ROM_NAME=$ROM_NAME -v $(pwd)/android:/root/android switchroot:build-android /root/entrypoint.sh
