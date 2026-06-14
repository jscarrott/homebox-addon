<!-- https://developers.home-assistant.io/docs/add-ons/presentation#keeping-a-changelog -->

## 0.26.2

- Package Homebox release 0.26.2 for the Home Assistant add-on.

## 2.1.0

- Updated Homebox to **v0.25.0** (from 0.16.0). First boot runs several
  forward-only schema migrations; existing data is preserved (the former
  `labels` table is migrated to `tags`). Back up before updating.
- Pinned both architectures to the same `ghcr.io/sysadminsmedia/homebox:0.25.0`
  multi-arch image (previously aarch64/armv7 used `0.16-arm` and amd64 used
  `latest`)
- Dropped the `armv7` architecture — upstream Homebox no longer publishes 32-bit
  arm images (0.25.0 provides only amd64 and arm64/aarch64)

## 2.0.5

- Fixed second startup crash (`database is locked (SQLITE_BUSY)`) by granting the
  AppArmor profile mmap + lock permissions on `/data` (`/data/** rwmk`). SQLite's
  WAL mode requires file locking and shared-memory mmap on `homebox.db` and its
  `-wal`/`-shm` sidecars; the inner service sub-profile previously allowed only
  `rw`, so Homebox could open the database but never lock it

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
