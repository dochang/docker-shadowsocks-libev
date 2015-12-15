FROM alpine:latest
MAINTAINER dochang@gmail.com

RUN set -ex && \
    build_deps='build-base linux-headers git autoconf libtool file openssl-dev' && \
    apk add --update-cache --virtual build-dependencies ${build_deps} && \
    src_dir=/usr/local/src/shadowsocks-libev && \
    git clone --branch v2.3.1 https://github.com/shadowsocks/shadowsocks-libev.git ${src_dir} && \
    cd ${src_dir} && \
    ./configure && \
    make && \
    cd src && \
    cp ss-local ss-server ss-redir ss-tunnel ss-manager /usr/local/bin && \
    cd / && \
    rm -rf ${src_dir} && \
    apk del --purge build-dependencies && \
    rm -rf /var/cache/apk/*

VOLUME ["/etc/shadowsocks"]
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
