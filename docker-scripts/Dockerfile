FROM pablozaiden/switchroot-android-build:base-latest

#by default, build icosa
ENV ROM_NAME "icosa"
#by default, build zip
ENV ROM_TYPE "zip"

#preserve cache in next to the code to improve build times
ENV CCACHE_DIR "${BUILDBASE}/android/.ccache"

USER build
WORKDIR ${BUILDBASE}

ADD --chown=build:build ./default-command.sh ${BUILDBASE}/default-command.sh
ADD --chown=build:build ./get-sources.sh ${BUILDBASE}/get-sources.sh
ADD --chown=build:build ./add-twrp-repo.sh ${BUILDBASE}/add-twrp-repo.sh
ADD --chown=build:build ./build.sh ${BUILDBASE}/build.sh
ADD --chown=build:build ./build-twrp.sh ${BUILDBASE}/build-twrp.sh
ADD --chown=build:build ./repopic-and-patch.sh ${BUILDBASE}/repopic-and-patch.sh
ADD --chown=build:build ./reset-changes-update-sources.sh ${BUILDBASE}/reset-changes-update-sources.sh
ADD --chown=build:build ./copy-to-output.sh ${BUILDBASE}/copy-to-output.sh
ADD --chown=build:build ./copy-twrp-to-output.sh ${BUILDBASE}/copy-twrp-to-output.sh
ADD --chown=build:build ./switch.xml ${BUILDBASE}/switch.xml

RUN chmod +x ./*.sh

CMD ${BUILDBASE}/default-command.sh