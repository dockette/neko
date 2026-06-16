# AGENTS.md

## Project

Dockette Neko is a Docker Compose wrapper around the upstream Neko virtual browser, with Chrome DevTools Protocol and Playwright MCP ports documented in `docker-compose.yml`.

## Development

- Use `docker compose config` for safe validation.
- Use `make test` for compose validation.
- Use `make build` only for the local compose baseline; this repository does not build a local Dockerfile in CI.
- Use `make run` or `docker compose up` to start the stack locally.
- Keep upstream Neko clone/build helpers out of CI unless they are intentionally hardened for network access.

## Maintenance

- Preserve this repository as a compose wrapper unless the Docker image strategy changes.
- Do not add Slack badges.
- Keep README badges aligned with `dockette/copybara` style.
