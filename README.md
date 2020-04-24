# Dockerized environment to build Switchroot Android image

This repo provides A Dockerfile (`docker-scripts/Dockerfile`) to create the basic environment for building Lineage and Switchroot Android

## How to use

- Install docker
- Clone/Download this repo in a drive where you have at least 250GB of free space
- Either prepend `sudo` to every command after this step, or allow the current user to run `docker` without sudo
- Run `./build-android.sh <rom_name: icosa | foster | foster_tab>` 
- Run `./extract-images.sh <rom_name: icosa | foster | foster_tab>`. It will copy the required images to `~/Downloads/images`

## How to fetch the latest code changes and rebuild

- Any subsequent `./build-android.sh <rom_name: icosa | foster | foster_tab>` execution will detect that the `./android/lineage` directoy contains files and will work unde the assumption that the source code was already downloaded at least once. Then it will re-sync the repos, re-apply patches and re-build
