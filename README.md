# Goal
Demonstration how to run build inside Docker in concourse pipeline.
This is based on previous work in [docker-in-concourse](https://github.com/xinzweb/docker-in-concourse)

# Benefits

- be able to use docker to build go project, ensure cross-platform build consistency
- be able to separate dep, build, check, and package in separate Dockerfiles
- cache intermediate results in separate container images to reduce iteration time
- final run image is only 6.4MB, even though the build environment is ~1GB
- multiple container images shared most content and not wasting spaces

# Demo

```bash
fly -t <your target> set-pipeline -p make-in-docker -c concourse/pipeline.yaml
```

trigger the job in the pipeline you should see job `make-in-docker-in-concourse`
finished with task `run dockerd`.

# Local build

```bash
make
```

It will demonstrate all the docker build locally, and run the `hi`.
