# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

LABEL org.opencontainers.image.source="https://github.com/jscarrott/homebox-addon"

# Use /data/tmp instead of /tmp for migrations and temp files,
# avoiding permission issues with the system /tmp directory.
ENV TMPDIR=/data/tmp

COPY rootfs /
