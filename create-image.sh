#!/bin/bash

# Fetch latest image from the registry to take advantage of the cache
docker pull pablozaiden/switchroot-android-build:latest

# Build locally in case of changes
docker build -t pablozaiden/switchroot-android-build ./docker-scripts
