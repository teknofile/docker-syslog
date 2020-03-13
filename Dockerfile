FROM alpine:3.11.3

RUN apk add --no-cache syslog-ng syslog-ng-examples

ENTRYPOINT ["echo"]
