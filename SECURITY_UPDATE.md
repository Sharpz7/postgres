# Docker security refresh — 2026-10-21

Build locally with `docker build --pull -t security-update/IMAGE:20261021 .` (replace IMAGE with this repository's image name). Production Compose uses the dated local tag and preserves its existing container name. Use the existing Compose project name and environment file when recreating services; do not run a blanket `down`, remove volumes, or start unrelated projects.

CircleCI now requires manual approval for a build and neither publishes mutable tags nor calls the legacy SharpCD deployment endpoint. Merge this configuration before resuming automated builds. The older default-branch configuration remains active until this change is merged.

PostgreSQL is upgraded from 11 to 17. **Never attach the PostgreSQL 11 data volume to this image.** Pause writers, take a fresh logical dump, restore into a new PostgreSQL 17 volume, compare every application table count, and test applications before cutover. Keep the original volume unchanged. Restoring a pg_dumpall backup into an initialized cluster requires omitting its duplicate `CREATE ROLE postgres;` statement and avoiding the image's application initialization SQL during the restore bootstrap.

The production cutover was rehearsed on an isolated network and used fresh named PostgreSQL and pgAdmin volumes. The original volumes remain available. Passwords were rehashed to SCRAM without changing application credentials. The unchanged gosu 1.19 source is compiled from an exact upstream commit with Go 1.27.3.

Build pgAdmin separately with `docker build --pull -t security-update/pgadmin:20261021 pgadmin`. It uses pgAdmin 9.18 with updated CA packages, certifi, Pillow and urllib3. Its data belongs at `/var/lib/pgadmin`, not `/root/.pgadmin`. Preserve the existing SQLite settings and storage; the previous deployment's actual data was in an anonymous volume. Its copied settings database migration and health endpoint were tested before production deployment.
