# AGENTS.md

## Project

Dockette Neko builds and publishes `dockette/neko:chromium` (the Neko virtual browser from a fork with Chrome DevTools Protocol and Playwright MCP support) and ships a Docker Compose file that runs it.

There is no Dockerfile here. CI fetches the fork `holyfork/m1k1o-neko` at a pinned commit and builds the image with the fork's own `./build` script.

## Versioning

- `VERSION` holds the release date and `NEKO_REF`, the full commit sha of the fork.
- `make release` sets the date to today (UTC); `make version` prints it.
- To update Neko, put a new full commit sha in `NEKO_REF` and run `make release`.
- Tags: `chromium` and `chromium-<VERSION>`, no `latest`.

## Development

- `make test` validates `docker-compose.yml`.
- `make build-chromium` fetches the pinned commit and builds the image (slow).
- `make test-docker` checks that Chromium runs in the built image.
- `make run` starts the stack.

## CI

- Pull requests build and test but never push. On master the image is pushed, a GitHub release is created and the Docker Hub description is synced.
- The fork is fetched over HTTPS at the exact `NEKO_REF` commit, never with `git pull` or SSH. Keep it that way.
- The chromium image is built on the `neko/base` image built in the same run, not on a pulled `ghcr.io` image.

## Maintenance

- Do not add Slack badges.
- Keep README badges aligned with `dockette/copybara` style.
