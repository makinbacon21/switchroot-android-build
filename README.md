# Dockerized environment to build Switchroot Android image

This repo provides A Dockerfile (`docker-scripts/Dockerfile`) to create the basic environment for building Lineage and Switchroot Android.

## Read this before doing anything else, or Voldemort will come for you:
This build environment is meant to replace the first part of the following guide: [Shitty Pie Guide](https://gitlab.com/ZachyCatGames/shitty-pie-guide)

Read and understand that guide before continuing.

After doing that, you can use this to replace everything in that guide up to `make bacon`. The output of this build should be the same output as that command.

## Build using the image in Dockerhub:
- Boot Linux (natively or a VM. Don't use *WSL* or *WSL 2* unless you *really* know what you are doing, since it has severe performance issues with this particular scenario)
- Install `docker` (proper docker installation. Avoid using Snap) 
- Go to a directory on a drive where there are at least 250GB of free space.
- Run the following commands:
```bash
mkdir -p ./android/lineage
sudo docker run --rm -ti -e ROM_NAME=icosa -v "$PWD"/android:/root/android pablozaiden/switchroot-android-build:latest
```
- Continue with the [Shitty Pie Guide](https://gitlab.com/ZachyCatGames/shitty-pie-guide), right after `make bacon`
- Note that the output of this build can also be used with hekate partitioning tools.

## Detailed usage information

### Requirements
- Docker
- At least 8GB RAM
- At least 200GB of free storage

### Build everything locally

- Clone/Download this repo.
- Either prepend `sudo` to the first command, or allow the current user to run `docker` without sudo
- Run `./build-android.sh --rom <icosa | foster | foster_tab> --rom-type <zip | images> --flags <nobuild | noupdate>`  
All parameters are optional. Default for --rom is `icosa`, default for --rom-type is `zip`, default for --flags is empty

- Any subsequent build execution will detect that the `./android/lineage` directoy contains files and will work under the assumption that the source code was already downloaded at least once. Then it will re-sync the repos, re-apply patches and re-build

*Important*: The docker image builds everything in the `/root/android` directory, inside the container. The `./build-android.sh` script mounts the host directory `./android` as a volume to that directory in the container, so the sources and build output can live after the container is destroyed.

If that directory is not properly mounted, the build may fail.

### Convenience scripts

There are several `.sh` scripts in the repo root, for convenience. You can find usage documentation inside each script.
