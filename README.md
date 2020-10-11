# Dockerized environment to build Switchroot Android image

This repo provides A Dockerfile (`docker-scripts/Dockerfile`) to create the basic environment for building Lineage and Switchroot Android.

**To use the prebuilt docker images, check out the [latest release](https://github.com/PabloZaiden/switchroot-android-build/releases/latest) in this GitHub repository.**

## Read this before doing anything else, or Voldemort will come for you and summon his dragons:
This build environment is meant to automate the steps from the following guide: [Q Tips Guide](https://gitlab.com/ZachyCatGames/q-tips-guide)

Read and understand that guide before continuing.

Also, if you have built Switchroot *Pie* before, delete the whole `./android` directory before starting with *Q*

After doing that, you can use this to generate the content of your SD card for flashing and installing via Hekate and TWRP.

## Build using the image in Dockerhub:
- Boot Linux (natively or a VM. Don't use *WSL* or *WSL 2* unless you *really* know what you are doing, since it has severe performance issues with this particular scenario)
- Install `docker` (**proper docker installation**: `apt install docker.io` if on Ubuntu. It *might* work if installed via Snap with the latest changes, but it wasn't tested. It now requires `--privileged` mode) 
- Go to a directory on a drive where there are at least 250GB of free space.
- Run the following commands:
```bash
mkdir -p ./android/lineage
sudo chown -R 1000:1000 ./android

# Don't use the "latest" tag unless you know what you're doing. 
# Use a versioned tag from https://hub.docker.com/r/pablozaiden/switchroot-android-build/tags
sudo docker run --privileged --rm -ti -e ROM_NAME=icosa -v "$PWD"/android:/build/android pablozaiden/switchroot-android-build:latest
```
- Copy the content of `./android/output` to the root of your SD card (partitioned as a single FAT32-formatted volume; format with Hekate as it ensures proper cluster size for performance)
- Create the remaining partitions from within Hekate, flash TWRP and install after that. (It is expected to see some errors about mounting some partitions in TWRP the first time flashing)

## Detailed usage information

### Requirements
- Docker
- At least 16GB of RAM
- At least 250GB of free storage

### Build everything locally

- Clone/Download this repo.
- Either prepend `sudo` to the first command, or allow the current user to run `docker` without sudo
- Run `./build-android.sh --rom <icosa | foster | foster_tab> --rom-type <zip | images> --flags <nobuild | noupdate | nooutput | with_twrp>`  
All parameters are optional. Default for --rom is `icosa`, default for --rom-type is `zip`, default for --flags is empty
- When building the `zip`, the required output for installing via Hekate will be copied to `./android/output`, unless the `nooutput` flag is present
- Any subsequent build execution will detect that the `./android/lineage` directoy contains files and will work under the assumption that the source code was already downloaded at least once. Then it will re-sync the repos, re-apply patches and re-build

*Important*: The docker image builds everything in the `/build/android` directory, inside the container. The `./build-android.sh` script mounts the host directory `./android` as a volume to that directory in the container, so the sources and build output can live after the container is destroyed.

If that directory is not properly mounted, the build may fail.

### Convenience scripts

There are several `.sh` scripts in the repo root, for convenience. You can find usage documentation inside each script.
