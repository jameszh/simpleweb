FROM golang:1.8.3  AS build-env

ADD . /go/src/github.com/jameszh/simpleweb
RUN go build -gcflags="-N -l" -o /simpleweb /go/src/github.com/jameszh/simpleweb



# final stage
FROM ubuntu:16.04
WORKDIR /
COPY --from=build-env /simpleweb /

RUN chmod +x  /webinar

EXPOSE 8000
CMD ["/simpleweb"]