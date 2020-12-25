#!/bin/bash

mkdir -p ./android/lineage
MKDIRSTATUS=$?

if [[ $MKDIRSTATUS -ne 0 ]]; then
    echo "Could not create work folders; check permissions."
    exit $MKDIRSTATUS
fi

echo Building ${ROM_NAME:-icosa}

BUILDBASE="/build"
docker run --privileged --rm -ti -e BUILD_HOSTNAME="$(hostname)" -e DUMMY_BUILD=${DUMMY_BUILD:-""} -e CUSTOM_BUILD="${CUSTOM_BUILD:-""}" -e ROM_NAME=${ROM_NAME:-icosa} -e ROM_TYPE=${ROM_TYPE:-zip} -e FLAGS=${FLAGS:-""} -v "$PWD"/android:${BUILDBASE}/android pablozaiden/switchroot-android-build
