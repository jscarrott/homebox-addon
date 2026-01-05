#!/usr/bin/with-contenv bashio
# Ensure a Homebox configuration file exists before starting the service

CONFIG_FILE="/data/config.yml"

if ! bashio::fs.file_exists "${CONFIG_FILE}"; then
  bashio::log.fatal "Missing Homebox configuration at ${CONFIG_FILE}. Create the file before starting the add-on."
  exit 1
fi
