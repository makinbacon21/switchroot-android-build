# Dockerized environment to build Switchroot Android image

This repo provides A Dockerfile (`docker-scripts/Dockerfile`) to create the basic environment for building Lineage and Switchroot Android.

## Read this before doing anything else, or Voldemort will come for you:
This build environment is meant to automate the steps from the following guide: [Shitty Pie Guide](https://gitlab.com/ZachyCatGames/shitty-pie-guide)

Read and understand that guide before continuing.

After doing that, you can use this to generate the content of your SD card for flashing and installing via hekate and twrp.

## Build using the image in Dockerhub:
- Boot Linux (natively or a VM. Don't use *WSL* or *WSL 2* unless you *really* know what you are doing, since it has severe performance issues with this particular scenario)
- Install `docker` (proper docker installation. It *might* work if installed via Snap with the latest changes, but it wasn't tested) 
- Go to a directory on a drive where there are at least 250GB of free space.
   - (Only if you have downloaded the sources before: make sure to change the owner on the `android` folder to 1000:1000, recursively. Current versions of the environment don't run as `root` anymore. As a last resort, remove the existing `android` folder altogether.)
- Run the following commands:
```bash
mkdir -p ./android/lineage
sudo docker run --rm -ti -e ROM_NAME=icosa -v "$PWD"/android:/build/android pablozaiden/switchroot-android-build:latest
```
- Copy the content of `./android/output` to the root of your SD card
- Partition and install from hekate

## Detailed usage information

### Requirements
- Docker
- At least 8GB RAM
- At least 200GB of free storage

### Build everything locally

- Clone/Download this repo.
- Either prepend `sudo` to the first command, or allow the current user to run `docker` without sudo
- Run `./build-android.sh --rom <icosa | foster | foster_tab> --rom-type <zip | images> --flags <nobuild | noupdate | nooutput>`  
All parameters are optional. Default for --rom is `icosa`, default for --rom-type is `zip`, default for --flags is empty
- When building the `zip`, the required output for installing via hekate will be copied to `./android/output`, unless the `nooutput` flag is present
- Any subsequent build execution will detect that the `./android/lineage` directoy contains files and will work under the assumption that the source code was already downloaded at least once. Then it will re-sync the repos, re-apply patches and re-build

*Important*: The docker image builds everything in the `/build/android` directory, inside the container. The `./build-android.sh` script mounts the host directory `./android` as a volume to that directory in the container, so the sources and build output can live after the container is destroyed.

If that directory is not properly mounted, the build may fail.

### Convenience scripts

There are several `.sh` scripts in the repo root, for convenience. You can find usage documentation inside each script.
