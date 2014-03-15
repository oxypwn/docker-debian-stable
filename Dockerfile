DOCKER-VERSION 0.9.0
FROM debian:jessie
MAINTAINER Paul Andrew Liljenberg <letters@paulnotcom.se>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN mv /sbin/initctl /sbin/initctl.old
RUN ln -s /sbin/true /sbin/initctl

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

RUN apt-get -qq update &&  apt-get -qqy upgrade
RUN apt-get -qqy install software-properties-common vim pwgen unzip curl git-core

