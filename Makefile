.PHONY: build
build: dep-in-docker build-in-docker check-in-docker package-in-docker

check: build
	docker run hi

dep-in-docker: Gopkg.lock Gopkg.toml
	docker build --iidfile dep-in-docker -t dep-in-docker -f Dockerfile_dep-in-docker .

sources := $(shell find . -name "*.go" -print)
build-in-docker: dep-in-docker $(sources)
	docker build --iidfile build-in-docker -t build-in-docker -f Dockerfile_build-in-docker .

check-in-docker: build-in-docker $(sources)
	docker build --iidfile check-in-docker -t check-in-docker -f Dockerfile_check-in-docker .

package-in-docker: check-in-docker $(sources)
	docker build --iidfile package-in-docker -t hi -f Dockerfile .
