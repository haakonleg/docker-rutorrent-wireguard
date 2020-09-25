FROM linuxserver/rutorrent:amd64-latest

ENV WG_SERVER=server

COPY docker-entrypoint.sh root/ /

RUN apk add --no-cache --upgrade curl wireguard-tools && \
    chmod +x /docker-entrypoint.sh

EXPOSE 80
ENTRYPOINT /docker-entrypoint.sh
