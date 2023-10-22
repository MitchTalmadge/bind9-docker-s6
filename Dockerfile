# Based partially on https://github.com/isc-projects/bind9-docker/blob/v9.16/Dockerfile
# ---
FROM ghcr.io/linuxserver/baseimage-alpine:3.16

COPY root/ /

# Install BIND9
RUN apk add --no-cache bind

# Configure Environment
RUN mkdir -p /etc/bind && chown root:abc /etc/bind/ && chmod 755 /etc/bind
RUN mkdir -p /var/cache/bind && chown abc:abc /var/cache/bind && chmod 755 /var/cache/bind
RUN mkdir -p /var/lib/bind && chown abc:abc /var/lib/bind && chmod 755 /var/lib/bind
RUN mkdir -p /var/log/bind && chown abc:abc /var/log/bind && chmod 755 /var/log/bind
RUN mkdir -p /run/named && chown abc:abc /run/named && chmod 755 /run/named

VOLUME ["/config", "/var/cache/bind", "/var/lib/bind", "/var/log"]

EXPOSE 53/udp 53/tcp 953/tcp