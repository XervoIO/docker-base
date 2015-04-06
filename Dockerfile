FROM phusion/baseimage:0.9.16
MAINTAINER Modulus <help@modulus.io>

Add . /opt/modulus

RUN /opt/modulus/bootstrap.sh

CMD ["/sbin/my_init"]
