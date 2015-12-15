#!/bin/bash
set -e
set -x

apt-get update
apt-get --purge remove -y openssh-server openssh-client openssh-sftp-server
apt-get upgrade -y
apt-get install -y wget git zip unzip python

# Create the mop user. All user code execution runs in this user.
groupadd -r mop -g 444
useradd -u 441 -r -g mop -d /mnt/home -s /bin/bash -c "Modulus Image User" mop

# Make Modulus bin directory available in all shells
sed -i 's@PATH="\(.*\)"@PATH="/opt/modulus/bin:\1"@' /etc/environment

# Install node.
curl -o /opt/modulus/nave.sh https://raw.githubusercontent.com/isaacs/nave/v0.5.1/nave.sh
bash /opt/modulus/nave.sh usemain 0.10.38
rm /opt/modulus/nave.sh

npm install -g npm@2.8.3
