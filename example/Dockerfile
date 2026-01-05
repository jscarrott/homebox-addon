# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

LABEL org.opencontainers.image.source="https://github.com/jscarrott/homebox-addon"

ENTRYPOINT ["/app/api"]
CMD ["/data/config.yml"]
