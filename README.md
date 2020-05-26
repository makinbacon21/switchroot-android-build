# Dockerized environment to build Switchroot Android image

This repo provides A Dockerfile (`docker-scripts/Dockerfile`) to create the basic environment for building Lineage and Switchroot Android

## TL;DR Guide:
- Install `docker` (proper docker installation. Avoid using Snap) 
- Download and build latest switchroot android sources
- Change the value of ROM_NAME to build different roms. Available roms: `icosa` (default android), `foster` (android tv, includes nvidia apps), `foster_tab` (default android, includes nvidia apps)
- Change the value of ROM_TYPE to change the rom type. Available types: `zip` (recommended, builds a flashable zip), `images` (builds individual images)

```bash
mkdir -p ./android/lineage
sudo docker run --rm -ti -e ROM_NAME=icosa -e ROM_TYPE=zip -v "$PWD"/android:/root/android pablozaiden/switchroot-android-build:1.0.2
```
- Copy the build and required files to flash to the SD Card (if you changed ROM_NAME before, change `icosa` to the rom name that you used, and set the correct `sd_mount_point`)
```
./add-files-to-sd.sh icosa <sd_mount_point>
```

- *or* if you changed BUILD_TYPE to `images`, extract the images so that you can flash them with fastboot/dd/scripts/whatever. Once again, if you changed ROM_NAME before, change `icosa` to whatever rom name you used.
```
./extract-images.sh icosa
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
- `sudo docker run --rm -ti -e ROM_NAME=icosa -e ROM_TYPE=zip -v "$PWD"/android:/root/android pablozaiden/switchroot-android-build:1.0.2`: Download sources and build (you can replace `icosa` with `foster` or `foster_tab` and `zip` with `images`)
- Copy the desired output files from `./android/lineage/out/target/product/`

or

- Run `./extract-images.sh <rom_name: icosa | foster | foster_tab>`. It will copy the required images to `./extract`

or

- Run `./add-files-to-sd.sh <rom_name> <sd_mount_point>` to copy the required files for flashing in hekate to the SD directly

### Build everything locally

- Clone/Download this repo in a drive where you have at least 250GB of free space (this will take some time to download around 75GB of sources, and then between 2 to 12 hours to build)
- Either prepend `sudo` to the first command, or allow the current user to run `docker` without sudo
- Run `./build-android.sh --rom <icosa | foster | foster_tab> --rom-type <zip | images>`  
Both options are optional. Default for --rom is `icosa`, default for --rom-type is `zip`
- Run `./extract-images.sh <rom_name: icosa | foster | foster_tab>`. It will copy the required images to `./extract`

*or*

- Run `./add-files-to-sd.sh <rom_name> <sd_mount_point>` to copy all the required files to the SD directly

## How to fetch the latest code changes and rebuild

- Any subsequent build execution will detect that the `./android/lineage` directoy contains files and will work unde the assumption that the source code was already downloaded at least once. Then it will re-sync the repos, re-apply patches and re-build

## How to start all over again

- Run `./reset.sh` (requires `sudo`). It will delete your `android` directory, where all the sources and build outputs are, and delete the docker image with the environment for the builds.
