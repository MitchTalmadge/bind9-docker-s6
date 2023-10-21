FROM ghcr.io/linuxserver/baseimage-alpine:3.16

# Install BIND9
RUN apk add bind -y