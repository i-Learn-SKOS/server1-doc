# i-Learn server 1 documentation

## Introduction

This repository's main reason of existence is its associated wiki, that can be consulted when browsing the git server's
webinterface for this repository and clicking its *Wiki* menu option or icon.

We're describing a first server (hence "server1) that can run our installed tools and applications.

However, while we're here, this repository contains some useful files as well.

## Structure in this repo

### Scripts in the top directory

The following scripts are useful, if this repo is checked out by a user with sudo rights on the server.

- `copy-config.sh`: this file copies all modified or added configuration files, resulting from following the instructions in the wiki.
  The copy goes into this repository, that can serve as a backup or reference.
  
- `update-containers.sh`: this is an example script that updates and restarts the docker images known in the project.
  It is provided as an example here, because it is written specifically for a given (private) gitlab server supporting docker registry functionality.

### Directories

The following directories are the result of running above mentioned `copy-config.sh`:

- `etc/...`: contains modified files found at the same position in the server's `/etc/...` directory structure.
- `var/...`: contains modified files found at the same position in the server's `/var/...` directory structure.
