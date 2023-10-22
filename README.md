# bind9-docker-s6
A BIND9 Alpine Docker image with S6 Overlay (Using [LinuxServer's base image](https://github.com/linuxserver/docker-baseimage-alpine/tree/master))

## Usage
Mount a volume at `/config` and place your `named.conf` file at `/config/bind/named.conf`. 

## Support
I don't really have a lot of time for providing support. If you can find a bug and fix it, feel free to submit a PR. Or fork this and continue it on your own, if you'd like.
