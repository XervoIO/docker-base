FROM phusion/baseimage:0.9.16
MAINTAINER Modulus <help@modulus.io>

ENV REFRESHED_ON=12-15-2015

Add . /opt/modulus

RUN /opt/modulus/bootstrap.sh

ENV TEMP_DIR /mnt/tmp
ENV TMPDIR /mnt/tmp
ENV TMP_DIR /mnt/tmp
ENV HOME /mnt/home

CMD ["/sbin/my_init"]
