FROM alpine:edge

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --update transmission-daemon

RUN adduser -D mediamanage
RUN mkdir -p /transmission-config
RUN chown -R mediamanage:mediamanage /transmission-config
RUN mkdir -p /downloads
RUN chown -R mediamanage:mediamanage /downloads

USER mediamanage
CMD transmission-daemon --foreground --allowed *.*.*.* --config-dir /transmission-config --download-dir /downloads
