<!-- https://developers.home-assistant.io/docs/add-ons/presentation#keeping-a-changelog -->

## 2.2.0

- Updated Homebox to **v0.26.2** (from 0.25.0). Back up before updating: first
  boot runs forward-only schema migrations.
- Both architectures now pin the plain `ghcr.io/sysadminsmedia/homebox:0.26.2`
  tag. Upstream publishes a single multi-arch manifest (amd64 + arm64) per
  release; the old `-arm` suffixed tag no longer exists.
- Fixed the daily release-sync workflow, which had been failing to open a bump
  PR and would have written a broken aarch64 image tag and a downgraded add-on
  version if it had succeeded.

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
