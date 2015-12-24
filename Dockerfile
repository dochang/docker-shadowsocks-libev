FROM dochang/confd:latest
MAINTAINER dochang@gmail.com

COPY scripts /scripts

RUN set -ex && \
    /scripts/shadowsocks-libev/install.sh && \
    /scripts/apk/clean.sh

VOLUME ["/etc/shadowsocks"]
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
