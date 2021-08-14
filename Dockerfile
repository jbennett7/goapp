FROM golang:1.12-alpine AS build
RUN apk add --no-cache git
RUN go get github.com/jbennett7/goapp
WORKDIR /go/src/github.com/jbennett7/goapp
RUN go build -o application

FROM golang:1.12-alpine
RUN mkdir /opt/goapp /opt/goapp/public /opt/goapp/scripts
COPY --from=build /go/src/github.com/jbennett7/application /opt/goapp/application
COPY --from=build /go/src/github.com/jbennett7/public/index.html /opt/goapp/public/index.html
COPY --from=build /go/src/github.com/jbennett7/scripts/start_server /opt/goapp/scripts/start_server
ENTRYPOINT ["/opt/goapp/application"]
EXPOSE 5000
