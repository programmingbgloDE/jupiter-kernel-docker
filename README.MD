# Milk V Jupiter - Docker build Environment

## What is this ?
This is a Docker based build environment for the Milk V Jupiter Kernel for Bianbu OS.

## How to use it ?

You need to have Docker and Docker Compose installed on your System. This is currently only tested with Linux Ubuntu, might work on other Systems to but beware of slowdowns due to the way, the files are mounted into the Docker container.

### Download Source
First, you need to download the source code. You can find a link to it on the official Milk V [Website](https://milkv.io/docs/jupiter/development-guide/kernel-compilation). 
To download it change into the `jupiter-kernel` directory and download it with `git clone <repo_url>` this might take a while depending on your interne speed.

After that change back to the root directory of this project and build the Docker image, with `docker compose build cross-compile`. 
When this is done, everything should be ready for you to run `docker compose run cross-compile bash`.

Everything after this is supposed to be run inside the docker container.

The downloaded repository should be in your working dir now, enter it.
Source prequisites with `source /tools/build_prequisite.sh` and after that you can simply run `/tools/build.sh`.
It might prompt, that the repo is not trustworthy, Just execute the command listed and then rerun `/tools/build.sh` to build kernel `.deb` files and `.dtb` files.
