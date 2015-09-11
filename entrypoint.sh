#!/bin/sh

set -e

[ $# -gt 0 ] || {
	set +e
	ss-server --help
	exit 0
}

cmd=$1
shift

conf_dir=/etc/shadowsocks
conf=${conf_dir}/config.json

case $(basename "${cmd}") in
ss-local|ss-server|ss-redir|ss-tunnel|ss-manager)
	[ ! -e "${conf}" ] || exec "${cmd}" -c ${conf} "$@"
	;;
esac
exec "${cmd}" "$@"
