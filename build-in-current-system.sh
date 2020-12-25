#!/bin/bash

if [[ -z $BUILDBASE ]]; then
    BUILDBASE="$(pwd)/build"
    mkdir -p $BUILDBASE
    echo "Using $BUILDBASE as build base directory"
fi

ANDROID_DIR="$BUILDBASE/android"

if [[ ! -d $ANDROID_DIR/lineage ]]; then
    if [[ "$(ls -A ./android/lineage)" && -z $DISABLE_SYMLINK_TO_DOCKER_BUILD ]]; then
        echo "Previous dockerized build found. Creating a symlink to it..."
        ln -s $(pwd)/android $ANDROID_DIR
    else
        mkdir -p $ANDROID_DIR/lineage
        MKDIRSTATUS=$?

        if [[ $MKDIRSTATUS -ne 0 ]]; then
            echo "Could not create work folders; check permissions."
            exit $MKDIRSTATUS
        fi
    fi
fi

if [[ -L "$ANDROID_DIR" && -d "$ANDROID_DIR" ]]; then
    echo "$ANDROID_DIR is a symlink from previous dockerized build"
fi

TPATH="${BUILDBASE}/platform-tools:${BUILDBASE}/jdk-9.0.4/bin:${BUILDBASE}/bin"
PATH="${TPATH}:${PATH}"
CCACHE_DIR="$ANDROID_DIR/.ccache"

export PATH
export CCACHE_DIR
export BUILDBASE

cp ./build-scripts/*.sh $BUILDBASE

echo Building $ROM_NAME
cd $BUILDBASE

./default-command.sh