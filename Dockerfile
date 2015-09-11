FROM buildpack-deps:jessie-scm
MAINTAINER dochang@gmail.com

RUN git clone --branch v2.3.1 https://github.com/shadowsocks/shadowsocks-libev.git /usr/src/shadowsocks-libev && \
    cd /usr/src/shadowsocks-libev && \
    apt-get update && \
    apt-get --yes install --no-install-recommends build-essential autoconf libtool libssl-dev && \
    ./configure && \
    make && \
    cd src && \
    cp ss-local ss-server ss-redir ss-tunnel ss-manager /usr/local/bin && \
    cd / && \
    apt-get --yes remove --purge --auto-remove build-essential autoconf libtool libssl-dev && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/src/shadowsocks-libev

VOLUME ["/etc/shadowsocks"]
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
