#!/bin/bash

# Build locally in case of changes
docker build --no-cache -t pablozaiden/switchroot-android-build:base-latest -f ./docker-scripts/Dockerfile-base ./docker-scripts
