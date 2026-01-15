#!/usr/bin/with-contenv bashio
# Ensure a Homebox configuration file exists before starting the service

CONFIG_FILE="/data/config.yml"
TMP_DIR="/data/tmp"

if ! bashio::fs.file_exists "${CONFIG_FILE}"; then
  bashio::log.warning "Missing Homebox configuration at ${CONFIG_FILE}; starting with defaults."
fi

if ! bashio::fs.directory_exists "${TMP_DIR}"; then
  bashio::log.info "Creating temporary directory at ${TMP_DIR}"
  mkdir -p "${TMP_DIR}"
fi

chmod 1777 "${TMP_DIR}"
