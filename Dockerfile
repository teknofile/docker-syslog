FROM alpine:3.11.3

ARG S6_VER="v1.22.1.0"
ARG S6_ARCH="amd64"

RUN apk add --no-cache \ 
  alpine-keys \
  apk-tools \
  busybox \
  build-dependencies \
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

RUN curl -o /tmp/s6-overlay.tar.gz -L "https://github.com/just-containers/s6-overlay/releases/download/%{S6_VER}/s6-overlay-%{S6_ARCH}.tar.gz"
RUN tar xfz /tmp/s6-overlay.tar.gz -C /
RUN groupmod -g 1000 users
RUN usermod -u 911 -U -d /config -s /bin/false tkf-user
RUN usermod -G users tkf-user
RUN mkdir -p /app /config /defaults

RUN rm -rf /tmp/* 

COPY root/ /

ENTRYPOINT ["/init"]
