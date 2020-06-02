#!/bin/bash

# Build locally in case of changes
docker build -t pablozaiden/switchroot-android-build:base-latest -f ./docker-scripts/Dockerfile-base ./docker-scripts
