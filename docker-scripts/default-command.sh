#!/bin/bash

cd ${BUILDBASE}

if [ "$(ls -A ./android/lineage)" ]; then
    echo "Sources found. Skipping..."
else
    echo "Getting sources..."
    ./get-sources.sh
fi

if [[ -z $FLAGS || ! -z ${FLAGS##*noupdate*} ]]; then
    cd ${BUILDBASE}
    ./reset-changes-update-sources.sh
    ./repopic-and-patch.sh
fi

if [[ -z $FLAGS || ! -z ${FLAGS##*nobuild*} ]]; then
    cd ${BUILDBASE}
    ./build.sh
    RESULT=$?
    if [[ $RESULT -ne 0 ]]; then
        exit -1
    fi
fi

if [[ "$ROM_TYPE" == "zip" ]]; then
    if [[ -z $FLAGS || ! -z ${FLAGS##*nooutput*} ]]; then
        echo "Copying output to ./android/output..."
        cd ${BUILDBASE}
        ./copy-to-output.sh
    fi
fi

if [[ -z ${FLAGS##*with_twrp*} ]]; then
    cd ${BUILDBASE}
    ./add-twrp-repo.sh
    cd ${BUILDBASE}
    ./build-twrp.sh
    RESULT=$?
    if [[ $RESULT -ne 0 ]]; then
        exit -1
    fi
    
    echo "Copying twrp output to ./android/output..."
    cd ${BUILDBASE}
    ./copy-twrp-to-output.sh

    # restore original recovery dir
    rm -rf ${BUILDBASE}/android/lineage/bootable/recovery
    mv ${BUILDBASE}/android/recovery-backup ${BUILDBASE}/android/lineage/bootable/recovery
fi