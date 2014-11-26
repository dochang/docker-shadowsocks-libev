FROM debian:wheezy
MAINTAINER dochang@gmail.com

RUN apt-get update \
  && apt-get --yes install libssl1.0.0 \
  && rm -rf /var/lib/apt/lists/*

COPY ss-local ss-server ss-redir ss-tunnel /usr/local/bin/

VOLUME ["/etc/shadowsocks"]
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
