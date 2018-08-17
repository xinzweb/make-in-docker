.PHONY: build
build: package-in-docker

.PHONY: check
check: build container-structure-test-in-docker
	docker run -v /var/run/docker.sock:/var/run/docker.sock container-structure-test-in-docker

container-structure-test-in-docker: Dockerfile_container-structure-test Dockerfile_test.yaml
	docker build --iidfile container-structure-test-in-docker -t container-structure-test-in-docker -f Dockerfile_container-structure-test .

dep-in-docker: Gopkg.lock Gopkg.toml Dockerfile_dep-in-docker
	docker build --iidfile dep-in-docker -t dep-in-docker -f Dockerfile_dep-in-docker .

sources := $(shell find . -name "*.go" -print)
build-in-docker: dep-in-docker $(sources) Dockerfile_build-in-docker
	docker build --iidfile build-in-docker -t build-in-docker -f Dockerfile_build-in-docker .

check-in-docker: build-in-docker $(sources) Dockerfile_check-in-docker
	docker build --iidfile check-in-docker -t check-in-docker -f Dockerfile_check-in-docker .

package-in-docker: check-in-docker Dockerfile
	docker build --iidfile package-in-docker -t hi -f Dockerfile .

clean:
	rm dep-in-docker
	rm build-in-docker
	rm check-in-docker
	rm package-in-docker
	rm container-structure-test-in-docker
