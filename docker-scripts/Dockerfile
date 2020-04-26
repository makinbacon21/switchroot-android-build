FROM ubuntu:19.10
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt upgrade -y
RUN apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev python libtinfo5 libncurses5 vim-common

RUN git config --global user.email "fake@name.com" && git config --global user.name Fake Name

RUN apt install -y wget curl
RUN wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip && unzip platform-tools-latest-linux.zip -d ~

RUN wget https://download.java.net/java/GA/jdk9/9.0.4/binaries/openjdk-9.0.4_linux-x64_bin.tar.gz
RUN tar -C /root/ -zxvf openjdk-9.0.4_linux-x64_bin.tar.gz

RUN mkdir -p /root/bin

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /root/bin/repo
RUN chmod a+x /root/bin/repo

ENV PATH="/root/platform-tools:/root/jdk-9.0.4/bin:/root/bin:${PATH}"

#by default, build icosa
ENV ROM_NAME "icosa"

WORKDIR /root
ADD ./default-command.sh /root/default-command.sh
ADD ./get-sources.sh /root/get-sources.sh
ADD ./build.sh /root/build.sh
ADD ./repopic-and-patch.sh /root/repopic-and-patch.sh
ADD ./reset-changes-update-sources.sh /root/reset-changes-update-sources.sh
RUN chmod a+x ./*.sh

CMD /root/default-command.sh