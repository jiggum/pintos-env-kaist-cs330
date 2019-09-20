FROM ubuntu:16.04

MAINTAINER jiggum <0s.dongmin@gmail.com>

WORKDIR /

# Install tools
RUN apt update \
    && apt install -y \
        wget gcc g++ make bzip2 python \
        pkg-config zlib1g-dev libglib2.0-dev \
        dh-autoreconf xorg-dev ncurses-dev gdb

# Prepare Pintos directory
RUN wget http://cps.kaist.ac.kr/~byunggill/pintos.tar.gz \
    && tar xvf pintos.tar.gz

# Install QEMU2.5.0
RUN wget http://download.qemu-project.org/qemu-2.5.0.tar.bz2 \
    && bzip2 -d qemu-2.5.0.tar.bz2 \
    && tar xvf qemu-2.5.0.tar \
    && cd qemu-2.5.0 \
    && ./configure \
    && make install \
    && cd ..

# Install bochs
RUN wget https://sourceforge.net/projects/bochs/files/bochs/2.2.6/bochs-2.2.6.tar.gz \
    && env SRCDIR=/ PINTOSDIR=/pintos DSTDIR=/usr/local \
        sh pintos/src/misc/bochs-2.2.6-build.sh 

# Cleaning
RUN apt-get clean autoclean \
    && rm -r qemu-2.5.0* pintos.tar.gz bochs-2.2.6.tar.gz \
    && rm -rf /var/lib/apt/* /var/lib/cache/* /var/lib/log/*

# Add Pintos to PATH
ENV PATH=$PATH:/pintos/src/utils

WORKDIR /pintos/src

