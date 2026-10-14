# Home Assistant Add-on: Homebox

## About

This add-on packages [Homebox](https://github.com/sysadminsmedia/homebox), a self-hosted inventory system, so you can run it directly from Home Assistant. The service listens on port `7745` and stores its data inside the add-on data directory.

## Configuration

Homebox can read an optional YAML configuration file at `/data/config.yml` inside the add-on container. You can create this file with the [File Editor](https://my.home-assistant.io/redirect/hassio_addon/?addon=a0d7b954_file_editor) add-on or any other method you prefer; if it is missing, the add-on will start with defaults.

You can expose the web interface to your network by keeping the default port mapping `7745 -> 7745` or by adjusting it within the add-on options.

## Data persistence

The add-on stores its configuration and Homebox database under `/data` so that your inventory persists across restarts and upgrades.
Temporary files (including database migrations) are stored under `/data/tmp` to avoid permission issues with the system `/tmp`.
