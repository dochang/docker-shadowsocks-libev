#!/bin/sh

set -ex

export SHADOWSOCKS_LIBEV_VERSION=v2.5.6

build_deps='build-base linux-headers git autoconf libtool file openssl-dev asciidoc xmlto pcre-dev'
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

# Run `scanelf` before removing build deps.  Otherwise `apk info` will not
# display non-existing deps.
deps="$( \
        scanelf --needed --nobanner --recursive /usr/local \
                | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
                | sort -u \
                | xargs -r apk info --installed \
                | sort -u \
)"
apk add --no-cache --virtual .shadowsocks-libev-deps ${deps}

apk del --purge .shadowsocks-libev-build-deps
