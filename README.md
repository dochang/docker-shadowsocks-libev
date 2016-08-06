Docker shadowsocks-libev
========================

[![Docker Stars](https://img.shields.io/docker/stars/dochang/shadowsocks-libev.svg)](https://hub.docker.com/r/dochang/shadowsocks-libev/)
[![Docker Pulls](https://img.shields.io/docker/pulls/dochang/shadowsocks-libev.svg)](https://hub.docker.com/r/dochang/shadowsocks-libev/)
[![](https://images.microbadger.com/badges/image/dochang/shadowsocks-libev:latest.svg)](http://microbadger.com/images/dochang/shadowsocks-libev:latest "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/dochang/shadowsocks-libev:latest.svg)](http://microbadger.com/images/dochang/shadowsocks-libev:latest "Get your own version badge on microbadger.com")

build
-----

    docker build .

run
---

    docker run -d -v /confdir:/etc/shadowsocks dochang/shadowsocks-libev:latest ss-local|ss-server|ss-redir|ss-tunnel|ss-manager [...]

