from check-in-docker as builder

WORKDIR /go/src/github.com/xinzweb/make-in-docker/cmd
RUN go build -o hi

from alpine as runner

COPY --from=builder /go/src/github.com/xinzweb/make-in-docker/cmd/hi /usr/bin/hi
RUN /usr/bin/hi
CMD /usr/bin/hi
