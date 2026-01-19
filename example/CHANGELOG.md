<!-- https://developers.home-assistant.io/docs/add-ons/presentation#keeping-a-changelog -->

## 2.0.4

- Fixed startup crash (`mkdir /tmp/migrations: permission denied`) by setting
  `TMPDIR=/data/tmp` and `HOME=/data` so Homebox extracts migrations to the
  writable, AppArmor-permitted `/data` instead of `/tmp`
- Dropped the unused positional config argument; Homebox is configured via the
  `HBOX_*` environment variables from the base image
- Granted the AppArmor service sub-profile access to `/tmp` as a safety net

## 2.0.3

- Cleaned up metadata and documentation for the Homebox add-on
- Updated container labels and image reference
- Ensured startup validates the presence of a Homebox configuration file
