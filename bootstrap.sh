#!/bin/bash
set -e
set -x

# Create the mop user. All user code execution runs in this user.
groupadd -r mop -g 444
useradd -u 441 -r -g mop -d /mnt/mop -s /bin/bash -c "Modulus Image User" mop
