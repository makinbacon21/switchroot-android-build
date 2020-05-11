#!/bin/bash

if [ "x$ROM_NAME" == "x"  ];
then
    echo "Missing ROM_NAME env variable. Expected icosa | foster | foster_tab"
    exit 1
fi

mkdir -p ./android/lineage
echo Building $ROM_NAME
docker run --rm -ti -e ROM_NAME=$ROM_NAME -v "$PWD"/android:/root/android pablozaiden/switchroot-android-build
