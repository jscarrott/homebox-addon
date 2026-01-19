# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

LABEL org.opencontainers.image.source="https://github.com/jscarrott/homebox-addon"

# The base sysadminsmedia/homebox image has no s6-overlay or bashio, so the
# rootfs service script never runs. Point Homebox's temp dir at /data, which is
# writable and permitted by the AppArmor profile; otherwise Homebox tries to
# extract migrations to /tmp and crashes with "mkdir /tmp/migrations: permission
# denied". Configuration comes from the HBOX_* env vars already set in the base
# image, so no positional config argument is needed.
ENV TMPDIR=/data/tmp \
    HOME=/data

ENTRYPOINT ["/app/api"]
