FROM alpine:3.11.3

RUN apk add --no-cache \ 
  alpine-keys \
  apk-tools \
  busybox \
  libc-utils \
  xz \
  bash \
  curl \
  tzdata \
  ca-certificates \
  coreutils \
  shadow \
  syslog-ng \ 
  syslog-ng-examples

ENTRYPOINT ["echo"]
