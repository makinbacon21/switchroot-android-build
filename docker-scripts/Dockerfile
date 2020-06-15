FROM pablozaiden/switchroot-android-build:base-latest

#by default, build icosa
ENV ROM_NAME "icosa"
#by default, build zip
ENV ROM_TYPE "zip"

#preserve cache in next to the code to improve build times
ENV CCACHE_DIR "/root/android/.ccache"

WORKDIR /root
ADD ./default-command.sh /root/default-command.sh
ADD ./get-sources.sh /root/get-sources.sh
ADD ./build.sh /root/build.sh
ADD ./repopic-and-patch.sh /root/repopic-and-patch.sh
ADD ./reset-changes-update-sources.sh /root/reset-changes-update-sources.sh
ADD ./copy-to-output.sh /root/copy-to-output.sh
RUN chmod a+x ./*.sh

CMD /root/default-command.sh