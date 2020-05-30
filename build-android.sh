#!/bin/bash

while (($# > 0))
    do
    declare Option="$1"
    declare Value="$2"

    case $Option in
    --rom)
        if [[ "$Value" != "icosa" && "$Value" != "foster" && "$Value" != "foster_tab" ]]; then
            echo "Invalid rom name. Expecting icosa | foster | foster_tab"
            exit 1
        fi
        declare ROM_NAME="$Value"
        shift
        shift
        ;;

    --rom-type)
        if [[ "$Value" != "zip" && "$Value" != "images" ]]; then
            echo "Invalid rom type. Expecting images | zip"
            exit 1
        fi
        declare ROM_TYPE="$Value"
        shift
        shift
        ;;

    --flags)
        if [ -z ${Value##*--*} ]; then
            echo "Flags must come last and the arguments must not be empty."
            exit 1
        fi
        declare FLAGS="$Value"
        shift
        shift
        ;;

    *)
        echo "Unknown option. Ignoring $Option."
        shift
        ;;

    esac
done

./create-image.sh

ROM_NAME=${ROM_NAME:-icosa} ROM_TYPE=${ROM_TYPE:-zip} FLAGS=${FLAGS:-""} ./build-in-docker.sh
