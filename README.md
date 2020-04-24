# Dockerized environment to build Switchroot Android image

This repo provides 3 dockerfiles:
- `Dockerfile.env`: Creates the basic environment + current source code, to start a full build. Used to create the `switchroot:env` docker image
- `Dockerfile.build`: Triggers the actual Android build. Based on the `switchroot:env` image. Used to create the `switchroot:build` docker image
- `Dockerfile.build-latest`: Updates the sources retreived when the `switchroot:env` docker image was created and triggers a build. Based on the `switchroot:build` docker image to - hopefully - save some rebuild time.

## How to use

- Install docker
- Clone/Download this repo
- Either prepend `sudo` to every command after this step, or allow the current user to run `docker` without sudo
- Run `./docker-image-env.sh` (Requires internet access. Will download around 40GB)
- Run `./docker-image.build.sh <rom_name: icosa | foster | foster_tab>` (Doesn't require internet access. Should take between 2 to 12 hours, depending on your setup. Once finished building the last Android image, it may take a few more minutes to actually finish the docker command because of the large layer commit times)
- Run `./extract-images.sh`. It will copy the required images to `~/Downloads/images`

## How to fetch the latest code changes and rebuild

- After a successfull build, run `./docker-image.build-latest.sh` (Requires internet access. *Should* take less time to finish than the first build)
- Run `./extract-images-latest.sh`. It will copy the required images to `~/Downloads/images`
