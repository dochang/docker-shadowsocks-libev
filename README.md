Docker shadowsocks-libev
========================

build
-----

    ./build.sh

run
---

    docker run -d -v /confdir:/etc/shadowsocks dochang/shadowsocks-libev:latest ss-local|ss-server|ss-redir|ss-tunnel [...]

