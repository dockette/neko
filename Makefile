# Include variables
include .env.dist
-include .env
export

up:
	docker compose up

enter:
	docker exec -it neko bash

download:
	@if [ -d ".tmp/neko" ]; then \
		cd .tmp/neko && git pull; \
	else \
		git clone git@github.com:holyfork/m1k1o-neko.git .tmp/neko; \
	fi

build-chromium:
	cd .tmp/neko && \
	./build -y -r neko
	cd .tmp/neko && \
	./build -y -a chromium -r neko
	docker tag neko/chromium ${DOCKER_CHROMIUM_IMAGE}

push-chromium:
	docker push ${DOCKER_CHROMIUM_IMAGE}
