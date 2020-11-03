#!/bin/bash

if [[ -z $BUILDBASE ]]; then
    BUILDBASE="$(pwd)/build"
    mkdir -p $BUILDBASE
    echo "Using $BUILDBASE as build base directory"
fi

sudo apt update -y
sudo apt install -y \
    bc \
    bison \
    build-essential \
    ccache \
    curl \
    flex \
    g++-multilib \
    gcc-multilib \
    git \
    gnupg \
    gperf \
    imagemagick \
    lib32ncurses5-dev \
    lib32readline-dev \
    lib32z1-dev \
    liblz4-tool \
    libncurses5-dev \
    libsdl1.2-dev \
    libssl-dev \
    libwxgtk3.0-gtk3-dev \
    libxml2 \
    libxml2-utils \
    lzop \
    pngcrush \
    rsync \
    schedtool \
    squashfs-tools \
    xsltproc \
    zip \
    zlib1g-dev \
    python \
    libtinfo5 \
    libncurses5 \
    vim-common \
    wget \
    curl \
    sudo \
    axel \
    nano

axel https://dl.google.com/android/repository/platform-tools-latest-linux.zip \
    && unzip platform-tools-latest-linux.zip -d ${BUILDBASE} \
    && rm platform-tools-latest-linux.zip


axel https://download.java.net/java/GA/jdk9/9.0.4/binaries/openjdk-9.0.4_linux-x64_bin.tar.gz \
    && tar -C ${BUILDBASE}/ -zxvf openjdk-9.0.4_linux-x64_bin.tar.gz \
    && rm openjdk-9.0.4_linux-x64_bin.tar.gz

mkdir -p ${BUILDBASE}/bin

curl https://storage.googleapis.com/git-repo-downloads/repo > ${BUILDBASE}/bin/repo
chmod a+x ${BUILDBASE}/bin/repo
