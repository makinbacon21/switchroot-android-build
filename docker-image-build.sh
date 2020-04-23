#!/bin/bash

if [ "x$1" == "x"  ];
then
    echo "Missing rom name. Expected icosa | foster | foster_tab"
    exit 1
else
    echo "Rom name: $1"
fi


docker build --build-arg ROM_NAME=$1 -f ./Dockerfile.build -t switchroot:build .