FROM golang:1.12-alpine
MKDIR /opt/goapp /opt/goapp/public /opt/goapp/scripts
COPY application /opt/goapp/application
COPY public/index /opt/goapp/public/index.html
COPY scripts/start_server /opt/goapp/scripts/start_server
ENTRYPOINT ["/opt/goapp/application"]
EXPOSE 5000
