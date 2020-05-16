# Dockerized environment to build Switchroot Android image

This repo provides A Dockerfile (`docker-scripts/Dockerfile`) to create the basic environment for building Lineage and Switchroot Android

## TL;DR Guide:
- Install `docker`
- Download and build latest switchroot android sources (you can change `icosa` with `foster` or `foster_tab`):
```bash
mkdir -p ./android/lineage
sudo docker run --rm -ti -e ROM_NAME=icosa -v "$PWD"/android:/root/android pablozaiden/switchroot-android-build:1.0.0
```

## How to use

*Important*: By default, the docker image builds everything in the `/root/android` directory, inside the container. The `./build-android.sh` script mounts the host directory `./android` as a volume to that directory in the container, so the sources and build output can live after the container is destroyed.
If you _don't want_ to do this, just create a container of the `pablozaiden/switchroot-android-build` docker image using the default command and it will download the latest sources and build everything. Take in account that doing this will result in losing the downloaded sources and build output after the container is destroyed.


### Requirements
- Docker
- At least 8GB RAM
- At least 200GB of free storage

### Use the image in Dockerhub

- `mkdir -p ./android/lineage`: Create the directory for the sources and build output
- `sudo docker run --rm -ti -e ROM_NAME=icosa -v "$PWD"/android:/root/android pablozaiden/switchroot-android-build:1.0.0`: Download sources and build (you can replace `icosa` with `foster` or `foster_tab`)
- Copy the desired output files from `./android/lineage/out/target/product/`

### Build everything locally

- Clone/Download this repo in a drive where you have at least 250GB of free space (this will take some time to download around 75GB of sources, and then between 2 to 12 hours to build)
- Either prepend `sudo` to the first command, or allow the current user to run `docker` without sudo
- Run `./build-android.sh <rom_name: icosa | foster | foster_tab>` 
- Run `./extract-images.sh <rom_name: icosa | foster | foster_tab>`. It will copy the required images to `./extract`

## How to fetch the latest code changes and rebuild

- Any subsequent build execution will detect that the `./android/lineage` directoy contains files and will work unde the assumption that the source code was already downloaded at least once. Then it will re-sync the repos, re-apply patches and re-build

## How to start all over again

- Run `./reset.sh` (requires `sudo`). It will delete your `android` directory, where all the sources and build outputs are, and delete the docker image with the environment for the builds.
