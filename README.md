Docker shadowsocks-libev
========================

[![Docker Stars](https://img.shields.io/docker/stars/dochang/shadowsocks-libev.svg)](https://hub.docker.com/r/dochang/shadowsocks-libev/)
[![Docker Pulls](https://img.shields.io/docker/pulls/dochang/shadowsocks-libev.svg)](https://hub.docker.com/r/dochang/shadowsocks-libev/)
[![](https://badge.imagelayers.io/dochang/shadowsocks-libev:latest.svg)](https://imagelayers.io/?images=dochang/shadowsocks-libev:latest 'Get your own badge on imagelayers.io')

build
-----

    docker build .

run
---

    docker run -d -v /confdir:/etc/shadowsocks dochang/shadowsocks-libev:latest ss-local|ss-server|ss-redir|ss-tunnel|ss-manager [...]

