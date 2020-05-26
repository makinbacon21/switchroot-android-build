#!/bin/bash

while (($# > 0))
	do
	declare Option="$1"
    declare Val="$2"
    
    echo Option: $Option
    echo Val: $Val
    case $Option in
    --rom)
        if [[ "$Val" != "icosa" && "$Val" != "foster" && "$Val" != "foster_tab" ]]
            then
            echo "Invalid rom name. Expecting icosa | foster | foster_tab"
            exit 1
        fi
        declare ROM_NAME="$Val"
        shift
        shift
        ;;
    --rom-type)
        if [[ "$Val" != "zip" && "$Val" != "images" ]]
            then
            echo "Invalid rom type. Expecting images | zip"
            exit 1
        fi
        declare ROM_TYPE="$Val"
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
