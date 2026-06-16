<h1 align=center>Dockette / Neko</h1>

<p align=center>
   <a href="https://github.com/dockette/neko/actions"><img src="https://github.com/dockette/neko/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/neko"><img src="https://img.shields.io/docker/pulls/dockette/neko.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

<p align=center>
    🐳 <a href="https://github.com/m1k1o/neko">Neko</a> is a self hosted virtual browser that runs in docker and uses WebRTC.
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

-----

## Motivation

Forked version supporting Chrome DevTools Protocol.

## Usage

1. Create `docker-compose.yml` file.

Copy [`docker-compose.yml`](./docker-compose.yml) file.

2. Start Docker services.

```
docker compose up
```

3. Open `http://localhost:8080` in your browser. Login `neko` / `admin`.

![](.docs/neko.png)

4. Use Chrome DevTools Protocol on `http://localhost:19222`.

5. Use Playwright MCP on `http://localhost:8931`.

6. Profit.

## Development

This repository is a Compose wrapper. CI validates the Compose configuration and does not clone or build upstream Neko.

```bash
make test
make build
make run
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
