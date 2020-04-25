#!/bin/bash

if [ "x$1" == "x"  ];
then
    echo "Missing rom name. Expected icosa | foster | foster_tab"
    exit 1
else
    echo "Rom name: $1"
    ROM_NAME=$1
fi

CURRENT_DIR=$(pwd | sed 's/ /\\ /g')

docker build -t switchroot:build-android ./docker-scripts
mkdir -p ./android/lineage

echo Building $ROM_NAME
docker run --rm -ti -e ROM_NAME=$ROM_NAME -v $CURRENT_DIR/android:/root/android switchroot:build-android /root/entrypoint.sh
