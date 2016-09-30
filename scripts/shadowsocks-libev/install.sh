#!/bin/sh

set -ex

export SHADOWSOCKS_LIBEV_VERSION=v2.5.3

build_deps='build-base linux-headers git autoconf libtool file openssl-dev asciidoc xmlto'
apk add --no-cache --virtual .shadowsocks-libev-build-deps ${build_deps}

src_dir=/usr/local/src/shadowsocks-libev
src_repo=https://github.com/shadowsocks/shadowsocks-libev.git
git clone --branch "${SHADOWSOCKS_LIBEV_VERSION}" "${src_repo}" ${src_dir}
cd ${src_dir}
./configure
make

cd src
install -c ss-local ss-server ss-redir ss-tunnel ss-manager /usr/local/bin
cd /

rm -rf ${src_dir}

apk del --purge .shadowsocks-libev-build-deps
