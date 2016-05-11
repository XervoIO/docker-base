#!/bin/bash
set -e
set -x

# Need to set them back for bootstrapping the container.
TEMP_DIR=/tmp
TMPDIR=/tmp
TMP_DIR=/tmp

apt-get update
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

# Install ImageMagick
export MAKEFLAGS="-j $(grep -c ^processor /proc/cpuinfo)"
cd /opt
wget http://www.imagemagick.org/download/ImageMagick.tar.gz
tar -xf ImageMagick.tar.gz && mv ImageMagick-* ImageMagick && cd ImageMagick && ./configure && make && sudo make install
# Disable coders that have known vulnerabilities in them
sed -i '/<policymap>/a <policy domain="coder" rights="none" pattern="EPHEMERAL" />\n  <policy domain="coder" rights="none" pattern="URL" />\n  <policy domain="coder" rights="none" pattern="HTTPS" />\n  <policy domain="coder" rights="none" pattern="MVG" />\n  <policy domain="coder" rights="none" pattern="MSL" />\n  <policy domain="coder" rights="none" pattern="TEXT" />\n  <policy domain="coder" rights="none" pattern="SHOW" />\n  <policy domain="coder" rights="none" pattern="WIN" />\n  <policy domain="coder" rights="none" pattern="PLT" />\n' /usr/local/etc/ImageMagick-7/policy.xml
ldconfig /usr/local/lib && rm -rf /opt/ImageMagick*

apt-get --purge remove -y openssh-client openssh-server openssh-sftp-server
apt-get autoremove -y
