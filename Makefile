# Include variables
include VERSION
include .env.dist
-include .env
export

# Upstream Neko fork, pinned by commit in VERSION (NEKO_REF)
NEKO_REPO=https://github.com/holyfork/m1k1o-neko.git
NEKO_DIR=.tmp/neko

# Two tags: chromium and chromium-<date>. There is no `latest`.
DOCKER_CHROMIUM_VERSIONED_IMAGE=${DOCKER_CHROMIUM_IMAGE}-${VERSION}

.PHONY: test
test:
	docker compose config

.PHONY: run
run:
	docker compose up

.PHONY: up
up:
	docker compose up

.PHONY: enter
enter:
	docker exec -it neko bash

# Fetch the exact NEKO_REF commit over HTTPS (no branch, no git pull)
.PHONY: download
download:
	rm -rf ${NEKO_DIR}
	git init -q ${NEKO_DIR}
	git -C ${NEKO_DIR} fetch -q --depth 1 ${NEKO_REPO} ${NEKO_REF}
	git -C ${NEKO_DIR} checkout -q FETCH_HEAD

# Upstream ./build: the base image first, then the chromium app on top of it
.PHONY: build-chromium
build-chromium: download
	cd ${NEKO_DIR} && PLATFORM=${DOCKER_PLATFORM} ./build -y -r neko
	cd ${NEKO_DIR} && PLATFORM=${DOCKER_PLATFORM} ./build -y -a chromium -r neko
	docker tag neko/chromium ${DOCKER_CHROMIUM_IMAGE}
	docker tag neko/chromium ${DOCKER_CHROMIUM_VERSIONED_IMAGE}

# Smoke test: chromium runs in the image
.PHONY: test-docker
test-docker:
	docker run --rm --platform ${DOCKER_PLATFORM} --entrypoint chromium ${DOCKER_CHROMIUM_IMAGE} --version

.PHONY: push-chromium
push-chromium:
	docker push ${DOCKER_CHROMIUM_IMAGE}
	docker push ${DOCKER_CHROMIUM_VERSIONED_IMAGE}

.PHONY: version
version:
	@echo ${VERSION}

.PHONY: release
release:
	@sed -i.bak "s/^VERSION=.*/VERSION=$$(date -u +%Y.%m.%d)/" VERSION && rm VERSION.bak
	@cat VERSION
