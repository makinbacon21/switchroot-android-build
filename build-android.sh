#!/bin/bash

while (($# > 0))
	do
	declare Option="$1"
    
    case $Option in
    --rom)
        if [ "$Option" != "icosa" && "$Option" != "foster" && "$Option" != "foster_tab" ]
            then
            echo "Invalid rom name. Expecting icosa | foster | foster_tab"
            exit 1
        fi
        declare ROM_NAME="$Option"
        shift
        shift
        ;;
    --rom-type)
        if [ "$Option" != "zip" && "$Option" != "images" ]
            then
            echo "Invalid rom type. Expecting images | zip"
            exit 1
        fi
        declare ROM_TYPE="$Option"
        shift
        shift
        ;;
    *)
    echo "Unknown option. Ignoring $Option."
    shift
    ;;
    esac
done
           

if [[ -z $ROM_TYPE ]]
    then
    echo "No rom type provided. Assuming zip"
    declare ROM_TYPE="zip"
fi

if [[ -z $ROM_NAME ]]
    then
    echo "No rom name provided. Assuming icosa"
    declare ROM_NAME="icosa"
fi
    
./create-image.sh
ROM_NAME=$ROM_NAME ROM_TYPE=$ROM_TYPE ./build-in-docker.sh
