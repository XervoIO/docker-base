#!/bin/bash
set -e
set -x

# Create the mop user. All user code execution runs in this user.
groupadd -r mop -g 444
useradd -u 441 -r -g mop -d /mnt/mop -s /bin/bash -c "Modulus Image User" mop

# Install node.
curl -o /opt/modulus/nave.sh https://raw.githubusercontent.com/isaacs/nave/v0.5.1/nave.sh
bash /opt/modulus/nave.sh usemain 0.10.38
rm /opt/modulus/nave.sh
