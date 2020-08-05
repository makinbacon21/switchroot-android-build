#!/bin/bash

# Build locally in case of changes
docker build --build-arg USER_ID=$(id -u ${USER}) --build-arg GROUP_ID=$(id -g ${USER}) -t pablozaiden/switchroot-android-build:base-latest -f ./docker-scripts/Dockerfile-base ./docker-scripts
