.PHONE: dep-in-docker
dep-in-docker:
	docker build -t dep-in-docker -f Dockerfile_dep-in-docker .

.PHONY: build-in-docker
build-in-docker:
	docker build -t build-in-docker -f Dockerfile_build-in-docker .

.PHONY: check-in-docker
check-in-docker:
	docker build -t check-in-docker -f Dockerfile_check-in-docker .

.PHONEY: docker
docker:
	docker build -t hi -f Dockerfile .
