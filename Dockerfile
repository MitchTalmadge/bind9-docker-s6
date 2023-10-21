# Based partially on https://github.com/isc-projects/bind9-docker/blob/v9.16/Dockerfile
# ---
FROM ghcr.io/linuxserver/baseimage-alpine:3.16

# Install BIND9
RUN apk add --no-cache bind

# Create Bind User
RUN addgroup -S bind && adduser -S bind -G bind

# Configure Environment
RUN mkdir -p /etc/bind && chown root:bind /etc/bind/ && chmod 755 /etc/bind
RUN mkdir -p /var/cache/bind && chown bind:bind /var/cache/bind && chmod 755 /var/cache/bind
RUN mkdir -p /var/lib/bind && chown bind:bind /var/lib/bind && chmod 755 /var/lib/bind
RUN mkdir -p /var/log/bind && chown bind:bind /var/log/bind && chmod 755 /var/log/bind
RUN mkdir -p /run/named && chown bind:bind /run/named && chmod 755 /run/named

VOLUME ["/etc/bind", "/var/cache/bind", "/var/lib/bind", "/var/log"]

EXPOSE 53/udp 53/tcp 953/tcp

CMD ["/usr/sbin/named", "-f", "-c", "/etc/bind/named.conf", "-u", "bind"]