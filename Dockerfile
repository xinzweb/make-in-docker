from golang:1.10

COPY . /tmp/hello
WORKDIR /tmp/hello
RUN go build
RUN ./hello
