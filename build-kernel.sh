#!/bin/bash

JOBS=$(($(nproc) + 1)) CUSTOM_BUILD="make -j${JOBS} bootimage" ./build-android.sh --flags noupdate
