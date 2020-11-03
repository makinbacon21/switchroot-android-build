#!/bin/bash

## This script copies the twrp build output to the output dir
## so it can be used by hekate

cd ${BUILDBASE}

echo "Creating switchroot install dir..."
mkdir -p ./android/output/switchroot/install
echo "Copying build recovery.img (twrp)..."
cp ./android/lineage/out/target/product/$ROM_NAME/recovery.img ./android/output/switchroot/install/twrp.img
