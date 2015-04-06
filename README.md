Modulus Base Docker Image
=========

The base Docker image for all Modulus deploy and runtime images.

## mop user
All user code is run under mop user/group by the Modulus platform.

## Volumes

`/mnt`

The base image requires a volume to be mounted at `/mnt` with a `mop` subdirectory.
This directory is the mop user's HOME directory. The `mop` subdirectory must
have sufficient permissions for the mop user to read/write.
