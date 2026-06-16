# Include variables
include .env.dist
-include .env
export

.PHONY: build
build:
	docker compose config

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

.PHONY: download
download:
	@if [ -d ".tmp/neko" ]; then \
		cd .tmp/neko && git pull; \
	else \
		git clone https://github.com/holyfork/m1k1o-neko.git .tmp/neko; \
	fi

.PHONY: build-chromium
build-chromium:
	cd .tmp/neko && \
	./build -y -r neko
	cd .tmp/neko && \
	./build -y -a chromium -r neko
	docker tag neko/chromium ${DOCKER_CHROMIUM_IMAGE}

.PHONY: push-chromium
push-chromium:
	docker push ${DOCKER_CHROMIUM_IMAGE}
