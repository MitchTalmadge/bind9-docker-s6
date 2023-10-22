# Based partially on https://github.com/isc-projects/bind9-docker/blob/v9.16/Dockerfile
# ---
FROM ghcr.io/linuxserver/baseimage-alpine:3.18

# Install BIND9
RUN apk add --no-cache \
  bind \
  bind-tools

# Configure Environment
RUN mkdir -p /run/named && chown abc:abc /run/named && chmod 755 /run/named

COPY root/ /
VOLUME ["/config", "/var/cache/bind", "/var/lib/bind", "/var/log"]
EXPOSE 53/udp 53/tcp 953/tcp