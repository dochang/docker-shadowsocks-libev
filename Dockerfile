FROM buildpack-deps:latest
MAINTAINER dochang@gmail.com

RUN git clone --branch v2.1.4 https://github.com/shadowsocks/shadowsocks-libev.git /usr/src/shadowsocks-libev && \
    cd /usr/src/shadowsocks-libev && \
    ./configure && \
    make && \
    cd src && \
    cp ss-local ss-server ss-redir ss-tunnel /usr/local/bin && \
    cd / && \
    rm -rf /usr/src/shadowsocks-libev

VOLUME ["/etc/shadowsocks"]
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
