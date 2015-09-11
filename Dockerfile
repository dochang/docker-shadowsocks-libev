FROM buildpack-deps:latest
MAINTAINER dochang@gmail.com

RUN git clone --branch v2.3.1 https://github.com/shadowsocks/shadowsocks-libev.git /usr/src/shadowsocks-libev && \
    cd /usr/src/shadowsocks-libev && \
    apt-get update && \
    apt-get --yes install build-essential autoconf libtool libssl-dev && \
    rm -rf /var/lib/apt/lists/* && \
    ./configure && \
    make && \
    cd src && \
    cp ss-local ss-server ss-redir ss-tunnel ss-manager /usr/local/bin && \
    cd / && \
    rm -rf /usr/src/shadowsocks-libev

VOLUME ["/etc/shadowsocks"]
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
