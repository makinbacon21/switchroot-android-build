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

export PATH
export CCACHE_DIR
export BUILDBASE

cp ./build-scripts/*.sh $BUILDBASE

echo Building $ROM_NAME
cd $BUILDBASE

./default-command.sh