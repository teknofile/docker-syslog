FROM alpine:3.8

RUN apk add --no-cache \
  syslog-ng \
  syslog-ng-examples

ENTRYPOINT ["echo"]
