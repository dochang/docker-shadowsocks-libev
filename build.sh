#!/bin/sh

tag=1.5.3
image=dochang/shadowsocks-libev

docker run --rm --volume=$(pwd):/target ${image}-builder:${tag}
docker build --tag=${image}:${tag} .
