#!/bin/sh
# Ensure required directories exist before starting the Homebox service

TMP_DIR="/data/tmp"

if [ ! -d "${TMP_DIR}" ]; then
  echo "Creating temporary directory at ${TMP_DIR}"
  mkdir -p "${TMP_DIR}"
fi

chmod 1777 "${TMP_DIR}"
