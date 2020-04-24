#!/bin/bash

if [ "x$1" == "x"  ];
then
    echo "Missing rom name. Expected icosa | foster | foster_tab"
    exit 1
else
    echo "Rom name: $1"
fi

DOCKER_IMAGE_TAG=build-latest
. ./extract-images.sh $1