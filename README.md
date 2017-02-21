# Xervo Base Docker Image

> The base Docker image for all Xervo deploy and runtime images.

## mop user
All user code is run under `mop` user/group by the Xervo platform.

## Volumes

`/mnt`

The volume mounted at `/mnt` requires the follow subdirectories to be created
by the host system and accessible by the `mop` user/group.

| Directory   | Environment Variables         | Usage
| ----------- | ----------------------------- | ----- 
| `/mnt/tmp`  | `TEMP_DIR` `TMPDIR` `TMP_DIR` | Temporary storage
| `/mnt/home` | `HOME`                        | The `mop` user's home directory

## Usage
The Xervo base image is used like any other image:

```
FROM: xervo/baseimage

# Customizations

# The base image extends phusion/baseimage so it's important to run
# the init system as the CMD.
CMD ["/sbin/my_init"]
```
