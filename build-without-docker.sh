#!/bin/bash

if [[ -z $BUILDBASE ]]; then
    BUILDBASE="$(pwd)/build"
    mkdir -p $BUILDBASE
    echo "Using $BUILDBASE as build base directory"
fi

mkdir -p $BUILDBASE/android/lineage
MKDIRSTATUS=$?

if [ $MKDIRSTATUS -ne 0 ]; then
    echo "Could not create work folders; check permissions."
    exit $MKDIRSTATUS
fi

TPATH="${BUILDBASE}/platform-tools:${BUILDBASE}/jdk-9.0.4/bin:${BUILDBASE}/bin"
PATH="${TPATH}:${PATH}"
CCACHE_DIR="${BUILDBASE}/android/.ccache"
EXTRA_CONTENT="$(pwd)/extra-content"

export PATH
export CCACHE_DIR
export BUILDBASE
export EXTRA_CONTENT

cp ./build-scripts/*.sh $BUILDBASE
cp ./build-scripts/*.txt $BUILDBASE

echo Building $ROM_NAME
cd $BUILDBASE

./default-command.sh